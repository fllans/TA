PROGRAM SampleBuffer


CurrentCycleTime_RT := _PRESET_CYCLE_TIME;

testBufferGenerator.StartGenerator := StartSampleBufferTest_RT;
testBufferGenerator.CntGenerator := CntSampleBufferTest_RT;
testBufferGenerator.PulseTimeGenerator := PulseTimeSampleBufferTest_RT;
testBufferGenerator();

SampleBuffer_BOOL_RT := testBufferGenerator.varOut_BOOL;
SampleBuffer_BYTE_RT := testBufferGenerator.varOut_BYTE;
SampleBuffer_DINT_RT := testBufferGenerator.varOut_DINT;
SampleBuffer_DWORD_RT := testBufferGenerator.varOut_DWORD;
SampleBuffer_INT_RT := testBufferGenerator.varOut_INT;
SampleBuffer_LINT_RT := testBufferGenerator.varOut_LINT;
SampleBuffer_LREAL_RT := testBufferGenerator.varOut_LREAL;
SampleBuffer_LWORD_RT := testBufferGenerator.varOut_LWORD;
SampleBuffer_REAL_RT := testBufferGenerator.varOut_REAL;
SampleBuffer_SINT_RT := testBufferGenerator.varOut_SINT;
SampleBuffer_TIME_RT := testBufferGenerator.varOut_TIME;
SampleBuffer_UDINT_RT := testBufferGenerator.varOut_UDINT;
SampleBuffer_UINT_RT := testBufferGenerator.varOut_UINT;
SampleBuffer_ULINT_RT := testBufferGenerator.varOut_ULINT;
SampleBuffer_USINT_RT := testBufferGenerator.varOut_USINT;
SampleBuffer_WORD_RT := testBufferGenerator.varOut_WORD;

IF testBufferGenerator.FinalGenerating THEN
    StartSampleBufferTest_RT := FALSE;
    CntSampleBufferTest_RT := 0;
    PulseTimeSampleBufferTest_RT := T#0ms;
END_IF;


END_PROGRAM