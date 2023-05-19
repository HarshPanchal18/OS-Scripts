MIN_LOWER_ALPHA = 97
MAX_LOWER_ALPHA = 122

MIN_UPPER_ALPHA = 65
MAX_UPPER_ALPHA = 90

MIN_NUM_CODE = 48
MAX_NUM_CODE = 57

DASH_CODE = 45
DOT_CODE = 46
UNDERSCORE_CODE = 95
AT_CODE = 64

class EmailValidator:

    def __init__(self):
        pass

    def validate(self, email: str):
        errors = []

        email = email.replace('[at]', '@')
        email = email.replace('[.at]', '@')
        email = email.replace('[dot]', '.')
        email = email.replace('[.dot]', '.')

        atCount = email.count('@')

        if atCount != 1:
            less = 'Missing @'
            more = 'There are %d\'@\'s' % atCount
            errors.append(less if atCount < 1 else more)

        afterAt = ''
        try:
            afterAt = email[email.rindex('@')+1:]
            if afterAt.count('.') < 1:
                errors.append('Missing . after @')
        except Exception:
            pass

        invalidChars = []
        for ch in afterAt:
            if not self.__checkChar__(ch):
                invalidChars.append(ch)

        for ch in invalidChars:
            errors.append('Invalid character: \'%s\'' % ch)

        try:
            lastDot = afterAt.rindex('.')
            lastPart = afterAt[lastDot+1:]
            if not (2 <= len(lastPart) <= 15):
                text = 'Domain extension must be between 2 and 15 characters long.'
                errors.append(text+' Found: %d characters. ' % len(lastPart))
        except Exception:
            pass

        return len(errors) <= 0, errors

    def __checkChar__(self, ch):
        try:
            if MIN_LOWER_ALPHA <= ord(ch) <= MAX_LOWER_ALPHA:
                return True
            elif MIN_UPPER_ALPHA <= ord(ch) <= MAX_UPPER_ALPHA:
                return True
            elif MIN_NUM_CODE <= ord(ch) <= MAX_NUM_CODE:
                return True
            elif ord(ch) == DOT_CODE or ord(ch) == UNDERSCORE_CODE or ord(ch) == DASH_CODE:
                return True
        except Exception:
            pass

        return False
