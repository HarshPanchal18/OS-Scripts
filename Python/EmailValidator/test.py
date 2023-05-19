from validator import EmailValidator

# Basic Email Validator (bemval)
# Super simple and / or basic email validator without using external libraries(i.e. just python std functions)

# pip3 install -U bemval
# from bemval.validator import EmailValidator


# def main():
validator = EmailValidator()
valid, errors = validator.validate('is.this-as@email.com')

print('Is a valid mail -> %s' % ('YES' if valid else 'NO'))
if len(errors) > 0:
    print('Errors:\n- %s' % '\n- '.join(errors))
