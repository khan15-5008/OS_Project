#!/bin/bash
# Pad a string to a multiple of 16 bytes
pad_string() {
  local input="$1"
  local padding_length=$((16 - (${#input} % 16)))
  printf "%s" "$input" | tr '\n' '\0'
  for ((i=0; i<padding_length; i++)); do printf '\0'; done
}

# Generate a SHA-256 key from a password
generate_key() {
  local password="$1"
  echo -n "$password" | sha256sum | awk '{print $1}'
}


# Encrypt a file
encrypt_file() {
  local file="$1"
  local key="$2"
  local iv
  iv=$(openssl rand -hex 16) # Generate a random IV


  # Encrypt the file using OpenSSL
  openssl enc -aes-256-cbc -in "$file" -out "${file}.enc" -K "$key" -iv "$iv"
  echo "$iv" > "${file}.iv" # Save the IV for decryption
  echo "File encrypted as ${file}.enc"
}


# Decrypt a file
decrypt_file() {
  local encrypted_file="$1"
  local key="$2"
  local iv_file="${encrypted_file%.enc}.iv"
 
  if [[ ! -f "$iv_file" ]]; then
    echo "IV file ($iv_file) not found! Decryption failed."
    return 1
  fi


  local iv
  iv=$(cat "$iv_file")

  # Decrypt the file using OpenSSL
  openssl enc -d -aes-256-cbc -in "$encrypted_file" -out "${encrypted_file%.enc}_decrypted" -K "$key" -iv "$iv"
  echo "File decrypted as ${encrypted_file%.enc}_decrypted"
}


# Main script
echo -n "Do you want to (E)ncrypt or (D)ecrypt a file? "
read -r action


echo -n "Enter the file name: "
read -r file_name


echo -n "Enter the password: "
read -r -s password
echo


# Generate the key from the password
key=$(generate_key "$password")


if [[ "$action" =~ ^[eE]$ ]]; then
  encrypt_file "$file_name" "$key"
elif [[ "$action" =~ ^[dD]$ ]]; then
  decrypt_file "$file_name" "$key"
else
  echo "Invalid action. Use 'E' to encrypt or 'D' to decrypt."
fi
