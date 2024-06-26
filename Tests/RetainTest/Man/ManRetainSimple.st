PROGRAM ManRetainSimple


// ПРОСТЫЕ ТИПЫ
IF TRIGGER_IMP.Q AND StartManRetainTest THEN 
    RETAINTEST_RETAIN_SIMPLE_BOOL := NOT RETAINTEST_RETAIN_SIMPLE_BOOL;
    RETAINTEST_RETAIN_SIMPLE_BYTE := RETAINTEST_RETAIN_SIMPLE_BYTE + 1;
    RETAINTEST_RETAIN_SIMPLE_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_RETAIN_SIMPLE_DINT * 86400);
    RETAINTEST_RETAIN_SIMPLE_DINT := RETAINTEST_RETAIN_SIMPLE_DINT + 1;
    RETAINTEST_RETAIN_SIMPLE_DWORD := RETAINTEST_RETAIN_SIMPLE_DWORD + 1;
    RETAINTEST_RETAIN_SIMPLE_INT := RETAINTEST_RETAIN_SIMPLE_INT + 1;
    RETAINTEST_RETAIN_SIMPLE_LINT := RETAINTEST_RETAIN_SIMPLE_LINT + 1;
    RETAINTEST_RETAIN_SIMPLE_LREAL := RETAINTEST_RETAIN_SIMPLE_LREAL + 1.1;
    RETAINTEST_RETAIN_SIMPLE_LWORD := RETAINTEST_RETAIN_SIMPLE_LWORD + 1;
    RETAINTEST_RETAIN_SIMPLE_REAL := RETAINTEST_RETAIN_SIMPLE_REAL + 1.1;
    RETAINTEST_RETAIN_SIMPLE_SINT := RETAINTEST_RETAIN_SIMPLE_SINT + 1;
    RETAINTEST_RETAIN_SIMPLE_STRING := ANY_TO_STRING(RETAINTEST_RETAIN_SIMPLE_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_RETAIN_SIMPLE_TIME);
    RETAINTEST_RETAIN_SIMPLE_TIME := RETAINTEST_RETAIN_SIMPLE_TIME + PULSE_TIME;
    RETAINTEST_RETAIN_SIMPLE_UDINT := RETAINTEST_RETAIN_SIMPLE_UDINT + 1;
    RETAINTEST_RETAIN_SIMPLE_UINT := RETAINTEST_RETAIN_SIMPLE_UINT + 1;
    RETAINTEST_RETAIN_SIMPLE_ULINT := RETAINTEST_RETAIN_SIMPLE_ULINT + 1;
    RETAINTEST_RETAIN_SIMPLE_USINT := RETAINTEST_RETAIN_SIMPLE_USINT + 1;
    RETAINTEST_RETAIN_SIMPLE_WORD := RETAINTEST_RETAIN_SIMPLE_WORD + 1;

    RETAINTEST_NONRETAIN_SIMPLE_BOOL := NOT RETAINTEST_NONRETAIN_SIMPLE_BOOL;
    RETAINTEST_NONRETAIN_SIMPLE_BYTE := RETAINTEST_NONRETAIN_SIMPLE_BYTE + 1;
    RETAINTEST_NONRETAIN_SIMPLE_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_NONRETAIN_SIMPLE_DINT * 86400);
    RETAINTEST_NONRETAIN_SIMPLE_DINT := RETAINTEST_NONRETAIN_SIMPLE_DINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_DWORD := RETAINTEST_NONRETAIN_SIMPLE_DWORD + 1;
    RETAINTEST_NONRETAIN_SIMPLE_INT := RETAINTEST_NONRETAIN_SIMPLE_INT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_LINT := RETAINTEST_NONRETAIN_SIMPLE_LINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_LREAL := RETAINTEST_NONRETAIN_SIMPLE_LREAL + 1.1;
    RETAINTEST_NONRETAIN_SIMPLE_LWORD := RETAINTEST_NONRETAIN_SIMPLE_LWORD + 1;
    RETAINTEST_NONRETAIN_SIMPLE_REAL := RETAINTEST_NONRETAIN_SIMPLE_REAL + 1.1;
    RETAINTEST_NONRETAIN_SIMPLE_SINT := RETAINTEST_NONRETAIN_SIMPLE_SINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_STRING := ANY_TO_STRING(RETAINTEST_NONRETAIN_SIMPLE_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_NONRETAIN_SIMPLE_TIME);
    RETAINTEST_NONRETAIN_SIMPLE_TIME := RETAINTEST_NONRETAIN_SIMPLE_TIME + PULSE_TIME;
    RETAINTEST_NONRETAIN_SIMPLE_UDINT := RETAINTEST_NONRETAIN_SIMPLE_UDINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_UINT := RETAINTEST_NONRETAIN_SIMPLE_UINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_ULINT := RETAINTEST_NONRETAIN_SIMPLE_ULINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_USINT := RETAINTEST_NONRETAIN_SIMPLE_USINT + 1;
    RETAINTEST_NONRETAIN_SIMPLE_WORD := RETAINTEST_NONRETAIN_SIMPLE_WORD + 1;

    RETAINTEST_AUTO1_SIMPLE_BOOL := NOT RETAINTEST_AUTO1_SIMPLE_BOOL;
    RETAINTEST_AUTO1_SIMPLE_BYTE := RETAINTEST_AUTO1_SIMPLE_BYTE + 1;
    RETAINTEST_AUTO1_SIMPLE_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_AUTO1_SIMPLE_DINT * 86400);
    RETAINTEST_AUTO1_SIMPLE_DINT := RETAINTEST_AUTO1_SIMPLE_DINT + 1;
    RETAINTEST_AUTO1_SIMPLE_DWORD := RETAINTEST_AUTO1_SIMPLE_DWORD + 1;
    RETAINTEST_AUTO1_SIMPLE_INT := RETAINTEST_AUTO1_SIMPLE_INT + 1;
    RETAINTEST_AUTO1_SIMPLE_LINT := RETAINTEST_AUTO1_SIMPLE_LINT + 1;
    RETAINTEST_AUTO1_SIMPLE_LREAL := RETAINTEST_AUTO1_SIMPLE_LREAL + 1.1;
    RETAINTEST_AUTO1_SIMPLE_LWORD := RETAINTEST_AUTO1_SIMPLE_LWORD + 1;
    RETAINTEST_AUTO1_SIMPLE_REAL := RETAINTEST_AUTO1_SIMPLE_REAL + 1.1;
    RETAINTEST_AUTO1_SIMPLE_SINT := RETAINTEST_AUTO1_SIMPLE_SINT + 1;
    RETAINTEST_AUTO1_SIMPLE_STRING := ANY_TO_STRING(RETAINTEST_AUTO1_SIMPLE_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_AUTO1_SIMPLE_TIME);
    RETAINTEST_AUTO1_SIMPLE_TIME := RETAINTEST_AUTO1_SIMPLE_TIME + PULSE_TIME;
    RETAINTEST_AUTO1_SIMPLE_UDINT := RETAINTEST_AUTO1_SIMPLE_UDINT + 1;
    RETAINTEST_AUTO1_SIMPLE_UINT := RETAINTEST_AUTO1_SIMPLE_UINT + 1;
    RETAINTEST_AUTO1_SIMPLE_ULINT := RETAINTEST_AUTO1_SIMPLE_ULINT + 1;
    RETAINTEST_AUTO1_SIMPLE_USINT := RETAINTEST_AUTO1_SIMPLE_USINT + 1;
    RETAINTEST_AUTO1_SIMPLE_WORD := RETAINTEST_AUTO1_SIMPLE_WORD + 1;

    RETAINTEST_AUTO2_SIMPLE_BOOL := RETAINTEST_AUTO1_SIMPLE_BOOL;
    RETAINTEST_AUTO2_SIMPLE_BYTE := RETAINTEST_AUTO1_SIMPLE_BYTE;
    RETAINTEST_AUTO2_SIMPLE_DATE := RETAINTEST_AUTO1_SIMPLE_DATE;
    RETAINTEST_AUTO2_SIMPLE_DINT := RETAINTEST_AUTO1_SIMPLE_DINT;
    RETAINTEST_AUTO2_SIMPLE_DWORD := RETAINTEST_AUTO1_SIMPLE_DWORD;
    RETAINTEST_AUTO2_SIMPLE_INT := RETAINTEST_AUTO1_SIMPLE_INT;
    RETAINTEST_AUTO2_SIMPLE_LINT := RETAINTEST_AUTO1_SIMPLE_LINT;
    RETAINTEST_AUTO2_SIMPLE_LREAL := RETAINTEST_AUTO1_SIMPLE_LREAL;
    RETAINTEST_AUTO2_SIMPLE_LWORD := RETAINTEST_AUTO1_SIMPLE_LWORD;
    RETAINTEST_AUTO2_SIMPLE_REAL := RETAINTEST_AUTO1_SIMPLE_REAL;
    RETAINTEST_AUTO2_SIMPLE_SINT := RETAINTEST_AUTO1_SIMPLE_SINT;
    RETAINTEST_AUTO2_SIMPLE_STRING := RETAINTEST_AUTO1_SIMPLE_STRING;
    RETAINTEST_AUTO2_SIMPLE_TIME := RETAINTEST_AUTO1_SIMPLE_TIME;
    RETAINTEST_AUTO2_SIMPLE_UDINT := RETAINTEST_AUTO1_SIMPLE_UDINT;
    RETAINTEST_AUTO2_SIMPLE_UINT := RETAINTEST_AUTO1_SIMPLE_UINT;
    RETAINTEST_AUTO2_SIMPLE_ULINT := RETAINTEST_AUTO1_SIMPLE_ULINT;
    RETAINTEST_AUTO2_SIMPLE_USINT := RETAINTEST_AUTO1_SIMPLE_USINT;
    RETAINTEST_AUTO2_SIMPLE_WORD := RETAINTEST_AUTO1_SIMPLE_WORD;
END_IF;


// ПРОСТЫЕ ТИПЫ С ТЕХНОЛОГИЧЕСКИМИ ОБЪЕКТАМИ
IF TRIGGER_IMP.Q AND StartManRetainTest THEN 
    RETAINTEST_RETAIN_SIMPLETO_BOOL := NOT RETAINTEST_RETAIN_SIMPLETO_BOOL;
    RETAINTEST_RETAIN_SIMPLETO_BYTE := RETAINTEST_RETAIN_SIMPLETO_BYTE + 1;
    RETAINTEST_RETAIN_SIMPLETO_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_RETAIN_SIMPLETO_DINT * 86400);
    RETAINTEST_RETAIN_SIMPLETO_DINT := RETAINTEST_RETAIN_SIMPLETO_DINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_DWORD := RETAINTEST_RETAIN_SIMPLETO_DWORD + 1;
    RETAINTEST_RETAIN_SIMPLETO_INT := RETAINTEST_RETAIN_SIMPLETO_INT + 1;
    RETAINTEST_RETAIN_SIMPLETO_LINT := RETAINTEST_RETAIN_SIMPLETO_LINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_LREAL := RETAINTEST_RETAIN_SIMPLETO_LREAL + 1.1;
    RETAINTEST_RETAIN_SIMPLETO_LWORD := RETAINTEST_RETAIN_SIMPLETO_LWORD + 1;
    RETAINTEST_RETAIN_SIMPLETO_REAL := RETAINTEST_RETAIN_SIMPLETO_REAL + 1.1;
    RETAINTEST_RETAIN_SIMPLETO_SINT := RETAINTEST_RETAIN_SIMPLETO_SINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_STRING := ANY_TO_STRING(RETAINTEST_RETAIN_SIMPLETO_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_RETAIN_SIMPLETO_TIME);
    RETAINTEST_RETAIN_SIMPLETO_TIME := RETAINTEST_RETAIN_SIMPLETO_TIME + PULSE_TIME;
    RETAINTEST_RETAIN_SIMPLETO_UDINT := RETAINTEST_RETAIN_SIMPLETO_UDINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_UINT := RETAINTEST_RETAIN_SIMPLETO_UINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_ULINT := RETAINTEST_RETAIN_SIMPLETO_ULINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_USINT := RETAINTEST_RETAIN_SIMPLETO_USINT + 1;
    RETAINTEST_RETAIN_SIMPLETO_WORD := RETAINTEST_RETAIN_SIMPLETO_WORD + 1;

    RETAINTEST_NONRETAIN_SIMPLETO_BOOL := NOT RETAINTEST_NONRETAIN_SIMPLETO_BOOL;
    RETAINTEST_NONRETAIN_SIMPLETO_BYTE := RETAINTEST_NONRETAIN_SIMPLETO_BYTE + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_NONRETAIN_SIMPLETO_DINT * 86400);
    RETAINTEST_NONRETAIN_SIMPLETO_DINT := RETAINTEST_NONRETAIN_SIMPLETO_DINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_DWORD := RETAINTEST_NONRETAIN_SIMPLETO_DWORD + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_INT := RETAINTEST_NONRETAIN_SIMPLETO_INT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_LINT := RETAINTEST_NONRETAIN_SIMPLETO_LINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_LREAL := RETAINTEST_NONRETAIN_SIMPLETO_LREAL + 1.1;
    RETAINTEST_NONRETAIN_SIMPLETO_LWORD := RETAINTEST_NONRETAIN_SIMPLETO_LWORD + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_REAL := RETAINTEST_NONRETAIN_SIMPLETO_REAL + 1.1;
    RETAINTEST_NONRETAIN_SIMPLETO_SINT := RETAINTEST_NONRETAIN_SIMPLETO_SINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_STRING := ANY_TO_STRING(RETAINTEST_NONRETAIN_SIMPLETO_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_NONRETAIN_SIMPLETO_TIME);
    RETAINTEST_NONRETAIN_SIMPLETO_TIME := RETAINTEST_NONRETAIN_SIMPLETO_TIME + PULSE_TIME;
    RETAINTEST_NONRETAIN_SIMPLETO_UDINT := RETAINTEST_NONRETAIN_SIMPLETO_UDINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_UINT := RETAINTEST_NONRETAIN_SIMPLETO_UINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_ULINT := RETAINTEST_NONRETAIN_SIMPLETO_ULINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_USINT := RETAINTEST_NONRETAIN_SIMPLETO_USINT + 1;
    RETAINTEST_NONRETAIN_SIMPLETO_WORD := RETAINTEST_NONRETAIN_SIMPLETO_WORD + 1;

    RETAINTEST_AUTO1_SIMPLETO_BOOL := NOT RETAINTEST_AUTO1_SIMPLETO_BOOL;
    RETAINTEST_AUTO1_SIMPLETO_BYTE := RETAINTEST_AUTO1_SIMPLETO_BYTE + 1;
    RETAINTEST_AUTO1_SIMPLETO_DATE := ANY_TO_DATE(1445385600 + RETAINTEST_AUTO1_SIMPLETO_DINT * 86400);
    RETAINTEST_AUTO1_SIMPLETO_DINT := RETAINTEST_AUTO1_SIMPLETO_DINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_DWORD := RETAINTEST_AUTO1_SIMPLETO_DWORD + 1;
    RETAINTEST_AUTO1_SIMPLETO_INT := RETAINTEST_AUTO1_SIMPLETO_INT + 1;
    RETAINTEST_AUTO1_SIMPLETO_LINT := RETAINTEST_AUTO1_SIMPLETO_LINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_LREAL := RETAINTEST_AUTO1_SIMPLETO_LREAL + 1.1;
    RETAINTEST_AUTO1_SIMPLETO_LWORD := RETAINTEST_AUTO1_SIMPLETO_LWORD + 1;
    RETAINTEST_AUTO1_SIMPLETO_REAL := RETAINTEST_AUTO1_SIMPLETO_REAL + 1.1;
    RETAINTEST_AUTO1_SIMPLETO_SINT := RETAINTEST_AUTO1_SIMPLETO_SINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_STRING := ANY_TO_STRING(RETAINTEST_AUTO1_SIMPLETO_DINT) + ' ' + ANY_TO_STRING(RETAINTEST_AUTO1_SIMPLETO_TIME);
    RETAINTEST_AUTO1_SIMPLETO_TIME := RETAINTEST_AUTO1_SIMPLETO_TIME + PULSE_TIME;
    RETAINTEST_AUTO1_SIMPLETO_UDINT := RETAINTEST_AUTO1_SIMPLETO_UDINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_UINT := RETAINTEST_AUTO1_SIMPLETO_UINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_ULINT := RETAINTEST_AUTO1_SIMPLETO_ULINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_USINT := RETAINTEST_AUTO1_SIMPLETO_USINT + 1;
    RETAINTEST_AUTO1_SIMPLETO_WORD := RETAINTEST_AUTO1_SIMPLETO_WORD + 1;

    RETAINTEST_AUTO2_SIMPLETO_BOOL := RETAINTEST_AUTO1_SIMPLETO_BOOL;
    RETAINTEST_AUTO2_SIMPLETO_BYTE := RETAINTEST_AUTO1_SIMPLETO_BYTE;
    RETAINTEST_AUTO2_SIMPLETO_DATE := RETAINTEST_AUTO1_SIMPLETO_DATE;
    RETAINTEST_AUTO2_SIMPLETO_DINT := RETAINTEST_AUTO1_SIMPLETO_DINT;
    RETAINTEST_AUTO2_SIMPLETO_DWORD := RETAINTEST_AUTO1_SIMPLETO_DWORD;
    RETAINTEST_AUTO2_SIMPLETO_INT := RETAINTEST_AUTO1_SIMPLETO_INT;
    RETAINTEST_AUTO2_SIMPLETO_LINT := RETAINTEST_AUTO1_SIMPLETO_LINT;
    RETAINTEST_AUTO2_SIMPLETO_LREAL := RETAINTEST_AUTO1_SIMPLETO_LREAL;
    RETAINTEST_AUTO2_SIMPLETO_LWORD := RETAINTEST_AUTO1_SIMPLETO_LWORD;
    RETAINTEST_AUTO2_SIMPLETO_REAL := RETAINTEST_AUTO1_SIMPLETO_REAL;
    RETAINTEST_AUTO2_SIMPLETO_SINT := RETAINTEST_AUTO1_SIMPLETO_SINT;
    RETAINTEST_AUTO2_SIMPLETO_STRING := RETAINTEST_AUTO1_SIMPLETO_STRING;
    RETAINTEST_AUTO2_SIMPLETO_TIME := RETAINTEST_AUTO1_SIMPLETO_TIME;
    RETAINTEST_AUTO2_SIMPLETO_UDINT := RETAINTEST_AUTO1_SIMPLETO_UDINT;
    RETAINTEST_AUTO2_SIMPLETO_UINT := RETAINTEST_AUTO1_SIMPLETO_UINT;
    RETAINTEST_AUTO2_SIMPLETO_ULINT := RETAINTEST_AUTO1_SIMPLETO_ULINT;
    RETAINTEST_AUTO2_SIMPLETO_USINT := RETAINTEST_AUTO1_SIMPLETO_USINT;
    RETAINTEST_AUTO2_SIMPLETO_WORD := RETAINTEST_AUTO1_SIMPLETO_WORD;
END_IF;


END_PROGRAM