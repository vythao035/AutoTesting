*** Test Cases ***
TC002-operator testing
    ${a}                 Set Variable    ${5}
    ${b}                 Set Variable    ${4}
    ${tong}              Evaluate        ${a}+${b}
    Log To Console       Tổng hai số nguyên: ${a}+${b} là ${tong}