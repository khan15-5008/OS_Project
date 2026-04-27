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

Step 2: File Encryption
To encrypt a file, the script generates a random Initialization Vector (IV) for the AES encryption algorithm. It then uses OpenSSL to encrypt the file in CBC (Cipher Block Chaining) mode, which is a widely used encryption mode for file protection.

Step 3: File Decryption
To decrypt a file, the script retrieves the IV from the .iv file and uses OpenSSL to decrypt the encrypted file using the same AES key and IV that was used during encryption.

Step 4: Command-Line Interface (CLI) Flow
The script operates through a simple command-line interface. The user is prompted to either encrypt or decrypt a file, providing the necessary file name and password. Based on the user’s input, the system either performs encryption or decryption.

The implemented Secure File Protection Using AES Encryption system provides the following outputs:
File Encryption Process:
Input: Plaintext file (like Secret file.txt) and a secure password.
Output: An encrypted file (Secret file.txt.enc) and a corresponding IV file (Secret file.txt.iv).


Terminal Output:
![image alt](
)
![image alt](
)
![image alt](
)
![image alt](
)
![image alt](
)


