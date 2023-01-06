*** Setting ***
Library     RequestsLibrary

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  https://www.google.com

Quick Get Request With Parameters Test
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200

Get Request Test
    Create Session    google  http://www.google.com

    ${resp_google}=   GET On Session  google  /  expected_status=200
    ${resp_json}=     GET On Session  jsonplaceholder  /posts/1

    Should Be Equal As Strings          ${resp_google.reason}  OK
    Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident