FUNCTION_BLOCK varGenerator


IF CntGenerator = currentCntGenerator OR NOT StartGenerator THEN
    varOut_BOOL := FALSE;
    varOut_BYTE := 0;
    varOut_DATE := ANY_TO_DATE(0);
    varOut_DINT := 0;
    varOut_DWORD := 0;
    varOut_INT := 0;
    varOut_LINT := 0;
    varOut_LREAL := 0;
    varOut_LWORD := 0;
    varOut_REAL := 0;
    varOut_SINT := 0;
    varOut_STRING := ' ';
    varOut_TIME := T#0ms;
    varOut_UDINT := 0;
    varOut_UINT := 0;
    varOut_ULINT := 0;
    varOut_USINT := 0;
    varOut_WORD := 0;
            
    StartGenerator := FALSE;
    currentCntGenerator := 0;
    FinalGenerating := FALSE;    
END_IF;

IF StartGenerator THEN
    currentTimeGenerator := currentTimeGenerator + resCycleTime;

    IF currentTimeGenerator >= PulseTimeGenerator THEN
        varOut_BOOL := NOT varOut_BOOL;
        varOut_BYTE := varOut_BYTE + 1;
        varOut_DATE := ANY_TO_DATE(1445385600 + varOut_DINT * 86400);
        varOut_DINT := varOut_DINT + 1;
        varOut_DWORD := varOut_DWORD + 1;
        varOut_INT :=varOut_INT + 1;
        varOut_LINT := varOut_LINT + 1;
        varOut_LREAL := ANY_TO_LREAL(varOut_LINT) / 100;
        varOut_LWORD := varOut_LWORD + 1;
        varOut_REAL := ANY_TO_REAL(varOut_LINT) / 10;
        varOut_SINT := varOut_SINT + 1;
        varOut_STRING := ANY_TO_STRING(varOut_DINT) + ' ' + ANY_TO_STRING(varOut_TIME);
        varOut_TIME := varOut_TIME + PulseTimeGenerator;
        varOut_UDINT := varOut_UDINT + 1;
        varOut_UINT := varOut_UINT + 1;
        varOut_ULINT := varOut_ULINT + 1;
        varOut_USINT := varOut_USINT + 1;
        varOut_WORD := varOut_WORD + 1;

        currentTimeGenerator := T#0ms;
        currentCntGenerator := currentCntGenerator + 1;

        IF CntGenerator = currentCntGenerator THEN
            FinalGenerating := TRUE;
        END_IF;
    END_IF;
END_IF;


END_FUNCTION_BLOCK