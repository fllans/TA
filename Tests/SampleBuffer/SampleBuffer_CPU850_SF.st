PROGRAM SampleBuffer


CurrentCycleTime_SF := _PRESET_CYCLE_TIME;

testBufferGenerator.StartGenerator := StartSampleBufferTest_SF;
testBufferGenerator.CntGenerator := CntSampleBufferTest_SF;
testBufferGenerator.PulseTimeGenerator := PulseTimeSampleBufferTest_SF;
testBufferGenerator();

SampleBuffer_BOOL_SF := testBufferGenerator.varOut_BOOL;
SampleBuffer_BYTE_SF := testBufferGenerator.varOut_BYTE;
SampleBuffer_DINT_SF := testBufferGenerator.varOut_DINT;
SampleBuffer_DWORD_SF := testBufferGenerator.varOut_DWORD;
SampleBuffer_INT_SF := testBufferGenerator.varOut_INT;
SampleBuffer_LINT_SF := testBufferGenerator.varOut_LINT;
SampleBuffer_LREAL_SF := testBufferGenerator.varOut_LREAL;
SampleBuffer_LWORD_SF := testBufferGenerator.varOut_LWORD;
SampleBuffer_REAL_SF := testBufferGenerator.varOut_REAL;
SampleBuffer_SINT_SF := testBufferGenerator.varOut_SINT;
SampleBuffer_TIME_SF := testBufferGenerator.varOut_TIME;
SampleBuffer_UDINT_SF := testBufferGenerator.varOut_UDINT;
SampleBuffer_UINT_SF := testBufferGenerator.varOut_UINT;
SampleBuffer_ULINT_SF := testBufferGenerator.varOut_ULINT;
SampleBuffer_USINT_SF := testBufferGenerator.varOut_USINT;
SampleBuffer_WORD_SF := testBufferGenerator.varOut_WORD;

IF testBufferGenerator.FinalGenerating THEN
    StartSampleBufferTest_SF := FALSE;
    CntSampleBufferTest_SF := 0;
    PulseTimeSampleBufferTest_SF := T#0ms;
END_IF;


END_PROGRAM