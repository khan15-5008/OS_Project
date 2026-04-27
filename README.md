Introduction

In a progressively digital world, the security of sensitive information has become a critical priority. From personal files to confidential business documents, data security is more important to ensure privacy, stop unauthorized access, and reduce the risk of cyber attacks. This project aims to implement a secure file encryption system using the Advanced Encryption Standard (AES) algorithm. The primary aim is to protect sensitive files from unauthorized access by encrypting their content. Only users with the correct decryption key will be able to access the original data. In spite of the growth in technology, unauthorized access to files stands as a significant concern, affecting individuals, and organizations. This project addresses this problem by implementing Secure File Protection Using AES Encryption, using the robustness and certain of the Advanced Encryption Standard (AES). AES is a widely assumed encryption algorithm recognized for its ability to protect sensitive data effectively against common threats. By combining AES encryption into a file protection system, this project aims to deliver a solution that ensures the confidentiality and security of files, even in the face of attacks. This system is particularly valuable for protecting sensitive information in personal, professional, and organizational contexts, providing a dependable method to secure data against unauthorized access and cyber threats.
Project Outcome

The Secure File Protection Using AES Encryption project aims to achieve the following results:
 
Robust File Encryption Solution: A lightweight bash script designed to encrypt and decrypt files using the  Advanced Encryption Standard (AES), ensuring that sensitive data remains confidential and intact.
User-Friendly Automation: Streamlined command-line operations for file protection, which reduces the need for manual input and helps minimize user errors during the encryption or decryption process.
Enhanced Security: A secure, locally managed encryption method that reduces risks related to unauthorized access, data breaches, and dependence on third-party services.
Customization and Scalability: The bash script is easily adaptable or extendable to fit into other Linux-based workflows or to include additional security features.

Educational Contribution: Illustrates the practical application of operating system concepts and scripting to address real-world challenges, serving as a valuable learning resource for similar initiatives.
Portable Solution: A script that operates on any Linux environment with minimal dependencies, making it accessible and beneficial for a diverse range of users.
This project will yield a practical, efficient, and secure tool for file encryption, enabling users to safeguard their data without the need for specialized software or hardware.

Implementation

Step 1: Create AES Key
The first step in implementing AES encryption is to generate a cryptographic key from the user's password. This is achieved by applying the SHA-256 hashing function to the password. This ensures that the key is strong and has a fixed length of 256 bits.
generate_key() {
  local password="$1"
  echo -n "$password" | sha256sum | awk '{print $1}'
}


In this function, the password is passed through the sha256sum command to generate a 256-bit hash, which is then used as the AES encryption key.
Step 2: File Encryption
To encrypt a file, the script generates a random Initialization Vector (IV) for the AES encryption algorithm. It then uses OpenSSL to encrypt the file in CBC (Cipher Block Chaining) mode, which is a widely used encryption mode for file protection.
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

In this function, the OpenSSL enc command is used to perform AES encryption, with the generated IV being saved separately for decryption.
Step 3: File Decryption
To decrypt a file, the script retrieves the IV from the .iv file and uses OpenSSL to decrypt the encrypted file using the same AES key and IV that was used during encryption.
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
The openssl enc -d command is used here for decryption. The IV is fetched from the .iv file, ensuring that the original file can be restored to its unencrypted form.
Step 4: Command-Line Interface (CLI) Flow
The script operates through a simple command-line interface. The user is prompted to either encrypt or decrypt a file, providing the necessary file name and password. Based on the user’s input, the system either performs encryption or decryption.
echo -n "Do you want to (E)ncrypt or (D)encrypt a file? "
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


The user is prompted to choose between encryption and decryption. The file name and password are input by the user. The password is used to generate the AES key via the generate_key function. The appropriate function (encrypt_file or decrypt_file) is called based on the user's choice.
Testing the System: To test the system, create a text file (like testfile.txt), and run the script to encrypt and then decrypt it. Ensure that the file can be restored to its original content (./file_protection_script.sh).
Results and Discussion

The implemented Secure File Protection Using AES Encryption system provides the following outputs:
File Encryption Process:
Input: Plaintext file (like Secret file.txt) and a secure password.
Output: An encrypted file (Secret file.txt.enc) and a corresponding IV file (Secret file.txt.iv).


Terminal Output:
