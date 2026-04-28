# Secure File Protection System (AES Encryption)

A lightweight and secure file encryption system using AES encryption to protect sensitive files from unauthorized access.

---

## 📌 Overview
This project implements a secure file protection system using the Advanced Encryption Standard (AES). It ensures confidentiality of files by encrypting them so that only authorized users with the correct password can decrypt and access the original data.

The system is developed using Bash scripting and OpenSSL, making it lightweight, fast, and portable across Linux-based systems.

---

## 🎯 Key Features

- AES-based file encryption and decryption
- SHA-256 password-based key generation
- Secure Initialization Vector (IV) handling
- Command-Line Interface (CLI) for easy usage
- Lightweight and portable solution for Linux systems

---

## ⚙️ Implementation Workflow

### 🔑 Key Generation
- SHA-256 hashing is used to generate a secure 256-bit encryption key from the user password.

### 🔐 File Encryption
- AES encryption in CBC mode using OpenSSL
- Random IV generation for each encryption process

### 🔓 File Decryption
- Uses stored IV and password to restore original file

### 💻 CLI Operation
- User selects encryption or decryption via terminal commands
- System processes file accordingly

---

## 📦 Output Format

### Encryption
- Input: Plain file (e.g., `secret.txt`)
- Output:  
  - Encrypted file → `secret.txt.enc`  
  - IV file → `secret.txt.iv`

### Decryption
- Input: `.enc` file + `.iv` file + password  
- Output: Original restored file

---

## 📊 Discussion

- Uses **AES-256 encryption** for strong security
- Highly secure against brute-force attacks
- Lightweight and fast for small to medium files
- Requires proper password management for security
- Portable across Linux/Unix systems with OpenSSL installed

---

## 🚀 Future Improvements

- GUI-based interface for non-technical users  
- Multi-threaded support for large file encryption  
- Cross-platform compatibility (Windows support)  
- Cloud integration for secure file storage  

---

## 🛠️ Tech Stack

- Bash Scripting
- OpenSSL
- AES-256 Encryption
- SHA-256 Hashing

---

## 👨‍💻 Use Case

- Personal file protection
- Secure storage of sensitive documents
- System administration security tools

---

## 🔗 Repository
GitHub: https://github.com/your-username/aes-file-protection



Terminal Output:
![image alt](https://github.com/khan15-5008/OS_Project/blob/f9484bd91f464ce992a8ded297cc2dba3ad4e3b7/Screenshot%202026-04-27%20193555.png
)
File Decryption Process:

Input: Encrypted file (example.txt.enc), the corresponding IV file, and the same password.
Output: The original file was restored as example_decrypted.txt.
Terminal Output:
![image alt](https://github.com/khan15-5008/OS_Project/blob/8a3f848870304c695cc1b4313f661d6b665958ca/Screenshot%202026-04-27%20193628.png
)
Input: Plaintext file (Secret file.txt)
![image alt](https://github.com/khan15-5008/OS_Project/blob/6111b69424f9bbee893de380b473d0e463631e14/Screenshot%202026-04-27%20193656.png
)
Output: An encrypted file (Secret file.txt.enc)

![image alt](https://github.com/khan15-5008/OS_Project/blob/bcee9941416ebe25606d612d480a2e7fe0283290/Screenshot%202026-04-27%20193730.png
)
Output: The original file was restored as Secret file_decrypted.txt.

![image alt](https://github.com/khan15-5008/OS_Project/blob/34f3ea0949693cb1a40319d4217ccf6305b107de/Screenshot%202026-04-27%20193752.png
)

Discussion:

﻿The use of AES-256 encryption ensures sturdy protection in opposition to brute-force assaults. Password protection is crucial; vulnerable passwords can undermine the gadget's effectiveness no matter the sturdy encryption. The script performs encryption and decryption quickly for small to medium document sizes. However, processing very huge files would possibly introduce delays due to the sequential nature of the operations. The simple command-line interface makes the device on hand to customers familiar with terminal operations. The separation of the IV into a separate report complements protection but calls for cautious control by way of users. The answer is portable across Unix-like running systems with OpenSSL hooked up. Modifications are wanted for native compatibility on non-Unix systems like Windows. Personal Use: Ideal for individual customers needing a lightweight encryption tool. Useful for administrators to safely keep configuration documents or sensitive facts. Integrating multi-threading for dealing with larger documents. Adding a GUI for higher accessibility to non-technical users. Extending compatibility with Windows systems and cloud structures.
This project demonstrates a practical, stable answer for file protection, with the capacity for in addition refinement to deal with scalability and broader use cases.



