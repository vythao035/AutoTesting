*** Settings ***
Test Setup  Open Personal Docmentation Management

Library    Collections
Library    DateTime
Library    String

Resource    resource.robot

*** Variables ***
${Doc Element}          //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]
${Bill Element}         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]

${Num Docs Element}     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView
${Num Bills Element}    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView

${Doc Drop Button}      //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.widget.ImageView
${Bill Drop Button}     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/android.widget.ImageView

${Create New Doc Button}    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.ImageView
${Create New Bill Button}   //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ImageView

${Personal Docs Table Element}  //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[4]/android.view.ViewGroup

${Window Create Doc Title Element}     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView
${Window Doc Management Title Element}     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView

${Camera Button}            //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.ImageView
${Upload Image Button}      //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView
${Start Datetime}           //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView
${Start Datetime Field}     //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.EditText

${End Datetime}             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText
${End Datetime Field}       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.EditText
${Note Button}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.EditText
${Add New Doc}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]
${Droplist Type Doc Button}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ImageView

${Image Value}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]

${Doc Type Element}         //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.EditText
${Driving licence}          //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]
${Car Certificate}          //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[4]
${Civil Liability Insurance}    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]
${Certificate Of Inspection}    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[6]
${Other Doc}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]
${Document Named}               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.EditText

${Must Input Document Name Alert}       //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup

${Back Button}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ImageView
${Accept Create Doc Button}     //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]

${Delete Start Time}        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]/android.widget.TextView

*** Test Cases ***
Document_3
    Page Should Contain Element     ${Doc Element}
    Page Should Contain Element      ${Bill Element}

Document_4
    ${Num Docs}=    Get Text    ${Num Docs Element}
    Log To Console      ${Num Docs}

    IF    "${Num Docs}" != "0 giấy tờ"
        Click Element         ${Doc Drop Button}
        Sleep   2
        @{Personal Docs Table}=     Get WebElements     ${Personal Docs Table Element}
        ${Num Cur Personal Docs}    Set Variable    ${0}
        FOR    ${Personal Doc}      IN      @{Personal Docs Table}
            ${Num Cur Personal Docs}=   Evaluate        ${Num Cur Personal Docs}+${1}
            Log To Console  ${Num Cur Personal Docs}
        END
        ${Num Cur Personal Docs}=   Catenate    ${Num Cur Personal Docs} giấy tờ
        Log To Console  ${Num Cur Personal Docs}
    END

    Should Be Equal     "${Num Cur Personal Docs} "    "${Num Docs}"

#Document_5
#    Click Element         ${Doc Drop Button}
#    Sleep   2
#    @{Personal Docs Table}=     Get WebElements     ${Personal Docs Table Element}
#    ${Num Cur Personal Docs}    Set Variable    ${0}
#    FOR    ${Personal Doc}      IN      @{Personal Docs Table}
#        ${Num Cur Personal Docs}=   Evaluate        ${Num Cur Personal Docs}+${1}
#        Log To Console  ${Num Cur Personal Docs}
#    END
#
#    ${Num Doc Can Create}=  Evaluate    ${10}-${Num Cur Personal Docs}
#    Log To Console  ${Num Doc Can Create}
#
#    FOR     ${i}    IN RANGE    ${Num Doc Can Create}
#        Click Element   ${Create New Doc Button}


Document_6
    ${Num Docs}=    Get Text    ${Num Docs Element}
    Log To Console      ${Num Docs}

    IF    "${Num Docs}" != "10 giấy tờ"
        Click Element   ${Create New Doc Button}
        Sleep   2
        Wait Until Page Contains Element      ${Window Create Doc Title Element}
        ${Window Title}=   Get Text      ${Window Create Doc Title Element}

        Log To Console      ${Window Title}
        Should Be Equal     ${Window Title}    Thêm mới giấy tờ

        Page Should Contain Element     ${Upload Image Button}
        Page Should Contain Element     ${Start Datetime}
        Page Should Contain Element     ${End Datetime}
        Page Should Contain Element     ${Note Button}
        Page Should Contain Element     ${Droplist Type Doc Button}

        Swipe   ${127 + 500}     ${476+200}     ${127+1000}     ${476}      ${500}
        Sleep   1
        Page Should Contain Element     ${Add New Doc}
    END

Document_7
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element       ${Back Button}
    Sleep   3

    Wait Until Page Contains Element      ${Window Doc Management Title Element}
    ${Window Title}=   Get Text      ${Window Doc Management Title Element}

    Log To Console      ${Window Title}
    Should Be Equal     ${Window Title}    Quản lý giấy tờ cá nhân

#Document_8
#    Click Element   ${Create New Doc Button}
#    Wait Until Page Contains Element      ${Window Create Doc Title Element}
#


Document_9
    Click Element         ${Doc Drop Button}
    Sleep   2
    @{Personal Docs Table}=     Get WebElements     ${Personal Docs Table Element}
    ${Num Cur Personal Docs}    Set Variable    ${0}
    FOR    ${Personal Doc}      IN      @{Personal Docs Table}
        ${Num Cur Personal Docs}=   Evaluate        ${Num Cur Personal Docs}+${1}
        Log To Console  ${Num Cur Personal Docs}
    END

    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element   ${Droplist Type Doc Button}
    Sleep   2
    Click Element   ${Driving licence}

    Swipe   ${127 + 500}     ${476+200}     ${127+1000}     ${476}      ${500}
    Sleep   1
    Click Element     ${Add New Doc}
    Sleep   1
    Click Element       ${Accept Create Doc Button}

    Sleep   10
    ${Num Docs}=    Get Text    ${Num Docs Element}
    Log To Console      ${Num Docs}
    ${Num Cur Personal Docs}=   Evaluate    ${Num Cur Personal Docs}+1
    ${Num Cur Personal Docs}=   Catenate    ${Num Cur Personal Docs} giấy tờ
    Should Be Equal     "${Num Docs}"     "${Num Cur Personal Docs} "


Document_16
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    ${Defaul Doc Type}=     Get Text    ${Doc Type Element}
    Should Be Equal     "${Defaul Doc Type}"   "--Chọn--"

Document_17
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Page Should Contain Element    ${Driving licence}
    Page Should Contain Element    ${Car Certificate}
    Page Should Contain Element    ${Civil Liability Insurance}
    Page Should Contain Element    ${Certificate Of Inspection}
    Page Should Contain Element    ${Other Doc}

Document_18
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Certificate Of Inspection}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    ${Checked Doc}=     Catenate    ${Certificate Of Inspection}/android.widget.ImageView
    Log To Console      ${Checked Doc}
    Page Should Contain Element    ${Checked Doc}

Document_19
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    ${Checked Doc}=     Catenate    ${Other Doc}/android.widget.ImageView
    Log To Console      ${Checked Doc}
    Page Should Contain Element    ${Checked Doc}


Document_20
    Set Appium Timeout  20
    Click Element         ${Doc Drop Button}
    Sleep   2
    @{Personal Docs Table}=     Get WebElements     ${Personal Docs Table Element}
    ${Num Cur Personal Docs}    Set Variable    ${0}
    FOR    ${Personal Doc}      IN      @{Personal Docs Table}
        ${Num Cur Personal Docs}=   Evaluate        ${Num Cur Personal Docs}+${1}
        Log To Console  ${Num Cur Personal Docs}
    END

    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Swipe   ${127 + 500}     ${476+200}     ${127+1000}     ${476}      ${500}
    Sleep   1
    Click Element     ${Add New Doc}
    Sleep   1
    Click Element       ${Accept Create Doc Button}

    Sleep   10
    ${Num Docs}=    Get Text    ${Num Docs Element}
    Log To Console      ${Num Docs}
    ${Num Cur Personal Docs}=   Evaluate    ${Num Cur Personal Docs}+1
    ${Num Cur Personal Docs}=   Catenate    ${Num Cur Personal Docs} giấy tờ
    Should Not Be Equal     "${Num Docs}"     "${Num Cur Personal Docs} "


Document_21
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    ${Default Document Name}=   Get Text    ${Document Named}
    Log To Console      ${Default Document Name}
    Should Be Equal     ${Default Document Name}    ${EMPTY}

Document_22
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    ${Random Name With Length 51}=      Generate Random String  51
    Log To Console      ${Random Name With Length 51}
    Input Text  ${Document Named}   ${Random Name With Length 51}
    ${Max Chars Document Name}=     Get Substring   ${Random Name With Length 51}   0   50
    Log To Console      ${Max Chars Document Name}

    ${Input Document Name}=   Get Text    ${Document Named}
    Log To Console      ${Input Document Name}

    Should Be Equal     ${Input Document Name}      ${Max Chars Document Name}

Document_23
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3

    Swipe   ${127+700}     ${476+500}   ${127+500}      ${476}   ${500}
    Sleep   1
    ${Add New Doc}=     Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[7]
    Click Element     ${Add New Doc}
    Sleep   2

    Page Should Contain Element     ${Must Input Document Name Alert}

Document_24
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    ${Random Name With Length 10}=      Generate Random String  10
    Input Text  ${Document Named}   ${Random Name With Length 10}
    ${Input Document Name}=   Get Text    ${Document Named}

    Should Be Equal     ${Input Document Name}      ${Random Name With Length 10}

Document_25
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    ${Random Name With Length 10}=      Generate Random String  10
    ${Random Name With Space}=      Catenate    ${SPACE}${Random Name With Length 10}${SPACE}
    Log To Console         ${Random Name With Space}
    Input Text  ${Document Named}   ${Random Name With Space}
    ${Input Document Name}=   Get Text    ${Document Named}

    Should Be Equal     "${Input Document Name}"      "${Random Name With Length 10}"

#Document_26
#    Click Element   ${Create New Doc Button}
#    Wait Until Page Contains Element      ${Window Create Doc Title Element}
#    Click Element   ${Droplist Type Doc Button}
#    Sleep   2
#
#    Click Element    ${Other Doc}
#    Sleep   3
#    Page Should Contain Element     ${Document Named}
#
#    ${Random Name With Length 10}=      Generate Random String  10
#    Input Text  ${Document Named}   ${Random Name With Length 10}
#
#    ${Input Document Name}=   Get Text    ${Document Named}
#
#    Should Be Equal     "${Input Document Name}"      "${Random Name With Length 10}"


#Document_27
#    ${Copy Element}=    Set Variable    /
#    Click Element   ${Create New Doc Button}
#    Wait Until Page Contains Element      ${Window Create Doc Title Element}
#    Click Element   ${Droplist Type Doc Button}
#    Sleep   2
#
#    Click Element    ${Other Doc}
#    Sleep   3
#    Page Should Contain Element     ${Document Named}
#
#    ${Random Name With Length 10}=      Generate Random String  10
#    Input Text  ${Document Named}   ${Random Name With Length 10}
#
#    Tap With Number Of Taps     ${Document Named}
#    Copy To Clipboard           ${}

Document_28
    ${Delete Text Button}=  Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}
    Click Element   ${Droplist Type Doc Button}
    Sleep   2

    Click Element    ${Other Doc}
    Sleep   3
    Page Should Contain Element     ${Document Named}

    ${Random Name With Length 10}=      Generate Random String  10
    Input Text  ${Document Named}   ${Random Name With Length 10}

    Click Element   ${Delete Text Button}
    Sleep   1
    ${Input Document Name}=   Get Text    ${Document Named}

    Should Be Equal     ${Input Document Name}      ${EMPTY}

Document_29
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    ${Default Starttime Value}=     Get Text    ${Start Datetime}

    Should Be Equal     ${Default Starttime Value}  ${EMPTY}


Document_30
    ${Choose Date Field}=       Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout
    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element   ${Start Datetime}
    Sleep   3

    Page Should Contain Element     ${Choose Date Field}


Document_31
    ${Choose Date Field}=               Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout
    ${Current Year Element}=            Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.EditText
    ${Current Month Element}=           Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[2]/android.widget.EditText
    ${Current Day Element}=             Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[1]/android.widget.EditText
    ${Input Start Datetime}=            Set Variable    "2022-12-12"
    ${Accept Time}=                     Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]

    ${Input Start Datetime}=  Convert Date    ${Input Start Datetime}   datetime
    Log To Console      ${Input Start Datetime}

    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element   ${Start Datetime}
    Wait Until Page Contains Element       ${Choose Date Field}

    WHILE    ${True}
        ${Current Year}=    Get Text    ${Current Year Element}
        IF    "${Current Year}"=="${Input Start Datetime.year}"
#            Tap     ${Current Year Element}
            BREAK
        ELSE
            Swipe   ${700}      ${990}      ${700}      ${1200}     ${500}
        END
    END

    WHILE    ${True}
        ${Current Month}=    Get Text    ${Current Month Element}
        IF    "${Current Month}"=="Tháng ${Input Start Datetime.month}"
#            Tap     ${Current Month Element}
            BREAK
        ELSE
            Swipe   ${500}      ${990}      ${500}      ${1200}     ${500}
        END
    END

    WHILE    ${True}
        ${Current Day}=    Get Text    ${Current Day Element}
        IF    "${Current Day}"=="${Input Start Datetime.day}"
#            Tap     ${Current Year Element}
            BREAK
        ELSE
            Swipe   ${300}      ${990}      ${300}      ${1200}     ${500}
        END
    END

    Click Element       ${Accept Time}
    Sleep   2

    ${Input Start Datetime Value}=      Catenate    ${Input Start Datetime.day}-${Input Start Datetime.month}-${Input Start Datetime.year}

    ${Picked Date}=     Get Text    ${Start Datetime Field}
    Should Be Equal     ${Picked Date}     ${Input Start Datetime Value}


Document_32
    ${Choose Date Field}=               Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout
    ${Current Year Element}=            Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.EditText
    ${Current Month Element}=           Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[2]/android.widget.EditText
    ${Current Day Element}=             Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[1]/android.widget.EditText
    ${Input Start Datetime}=            Set Variable    "2022-12-12"
    ${Accept Time}=                     Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]

    ${Input Start Datetime}=  Convert Date    ${Input Start Datetime}   datetime
    Log To Console      ${Input Start Datetime}

    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element   ${Start Datetime}
    Wait Until Page Contains Element       ${Choose Date Field}

    ${Current Year}=    Get Text    ${Current Year Element}
    Swipe   ${700}      ${1200}      ${700}      ${900}     ${500}
    Sleep   2
    ${Year After Swipe}=    Get Text    ${Current Year Element}
    Should Be Equal     ${Current Year}     ${Year After Swipe}

    ${Current Month}=    Get Text    ${Current Month Element}
    Swipe   ${500}      ${1200}      ${500}      ${900}     ${500}
    Sleep   2
    ${Month After Swipe}=    Get Text    ${Current Month Element}

    ${Current Day}=    Get Text    ${Current Day Element}
    Swipe   ${300}      ${1200}      ${300}      ${900}     ${500}
    Sleep   2
    ${Day After Swipe}=    Get Text    ${Current Day Element}

Document_33
    ${Choose Date Field}=               Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout
    ${Current Year Element}=            Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[3]/android.widget.EditText
    ${Current Month Element}=           Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[2]/android.widget.EditText
    ${Current Day Element}=             Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[1]/android.widget.EditText
    ${Input Start Datetime}=            Set Variable    "2022-12-27"
    ${Accept Time}=                     Set Variable    //hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]

    ${Input Start Datetime}=  Convert Date    ${Input Start Datetime}   datetime
    Log To Console      ${Input Start Datetime}

    Click Element   ${Create New Doc Button}
    Wait Until Page Contains Element      ${Window Create Doc Title Element}

    Click Element   ${Start Datetime}
    Wait Until Page Contains Element       ${Choose Date Field}

    WHILE    ${True}
        ${Current Year}=    Get Text    ${Current Year Element}
        IF    "${Current Year}"=="${Input Start Datetime.year}"
#            Tap     ${Current Year Element}
            BREAK
        ELSE
            Swipe   ${700}      ${990}      ${700}      ${1200}     ${500}
        END
    END

    WHILE    ${True}
        ${Current Month}=    Get Text    ${Current Month Element}
        IF    "${Current Month}"=="Tháng ${Input Start Datetime.month}"
#            Tap     ${Current Month Element}
            BREAK
        ELSE
            Swipe   ${500}      ${990}      ${500}      ${1200}     ${500}
        END
    END

    WHILE    ${True}
        ${Current Day}=    Get Text    ${Current Day Element}
        IF    "${Current Day}"=="${Input Start Datetime.day}"
#            Tap     ${Current Year Element}
            BREAK
        ELSE
            Swipe   ${300}      ${990}      ${300}      ${1200}     ${500}
        END
    END

    Click Element       ${Accept Time}
    Sleep   2

    ${Picked Date}=     Get Text    ${Start Datetime Field}
    Should Not Be Equal     ${EMPTY}    ${Picked Date}

    Page Should Contain Element     ${Delete Start Time}
    Click Element       ${Delete Start Time}
    Sleep   2
    ${Picked Date}=     Get Text    ${Start Datetime Field}
    Should Be Equal     ${EMPTY}    ${Picked Date}