import bcrypt

# Generate a random salt
salt = bcrypt.gensalt()

# Hash the password with the salt
password = "mysecretpassword".encode("utf-8")
hashed_password = bcrypt.hashpw(password, salt)

# Print the salt and hashed password
print("Password: ", password)
print("Salt: ", salt)
print("Hashed password: ", hashed_password)

# Verify a password
if bcrypt.checkpw(password, hashed_password):
    print("Password is correct")
else:
    print("Password is incorrect")
