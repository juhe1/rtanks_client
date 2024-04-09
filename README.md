# Rtanks client source codes
Rtanks source code with some modifications (hacks). The code is obfuscated, but i am slowly deobfuscating things that i want to modify. So in future the code will come more readable, but it will never be fully deobfuscated. 

## Compiling
#### Preparing the SDKs
We need two SDKs, AIR SDK for debugging and FLEX SDK for compiling.

For compiling you should use flex_sdk_4.6.0.23201. It can be found here: https://github.com/JamesMGreene/node-flex-sdk/blob/master/FlexSDKs.md After extracting the SDK, you should replace "flex_sdk_4.6.0.23201/frameworks/libs/air/airglobal.swc" file with "this_repo/tools/airglobal.swc" file. The tools folder is on this repository. Tools folder can be deleted after the swc file is replaced.

Next download air SDK (https://airsdk.harman.com/download). Extract it where ever you want.

#### Configuring Visual Studio Code for compile
First install "AS3, MXML and SWF Extension Pack" extension. You can get it here: https://marketplace.visualstudio.com/items?itemName=bowlerhatllc.vscode-nextgenas.

To get debugging working, go into "this_repo/.vscode/launch.json" and change "runtimeExecutable" to point to your "adl.exe" (it is inside "air_sdk/bin/").

To be alble to compile, you should make some changes to your "settings.json" and to "this_repo/.vscode/tasks.json". Let's edit tasks.json first:
1. open tasks.json
2. Paste these lines: 
```
{
    "type": "actionscript",
    "debug": true,
    "group": "build",
    "problemMatcher": [],
    "label": "ActionScript: compile debug - asconfig.json"
},
{
    "type": "actionscript",
    "debug": false,
    "group": "build",
    "problemMatcher": [],
    "label": "ActionScript: compile release - asconfig.json"
}
```
3. Save (:D)

Now let's edit settings.json. You can open settings.json by pressing ctrl+shift+p and then type "Open User Settings (JSON)": 
1. Add new json line "as3mxml.sdk.framework":"path_to_sdk" to the json and replace "path_to_sdk" with your SDK location. example:
```
"as3mxml.sdk.framework": "D:\\juho1\\tankkin_modaus\\flash_SDKs\\flex_sdk_4.6.0.23201_mpl",
```
2. save

Now you can compile by clicking "ctrl+shift+p" (you can also get there by pressing "Terminal" from the vscode menu and then press "Run build task.."). Then search "ActionScript: compile debug - asconfig.json" and click it. Now it should compile.
![VSCode](/readme_pictures/vscode_compile.png)

You can debug by clicking "Run" and then "Start Debugging". Or then just hit "f5". Note that you need to be inside tab that contains actionscript code when you start debugger.

#### Configuring FlashDevelop for compile
Click "Project" button from top bar and then click "Properties" (Project->Properties). Now go to the SDK tab and paste your SDK path into the Custom SDK box (see picture below).
![FlashDevelop](/readme_pictures/flash_develop.png)

After that go to Output tab. Then in the TestProject section select "Run Custom Command...". After that click edit and paste your adl.exe location(it is inside the air SDK bin folder) and the repo bin folders apllication.xml location. Example: 
```
D:\juho1\omat_sovelukset\airsdk\bin\adl.exe D:\juho1\tankkin_modaus\rtanks\sources\2.4.2024\RTanks_2.4.2024\bin\application.xml
```
![FlashDevelop](/readme_pictures/flash_develop_run.png)

Now you can compile by clicking the compile button. To debug press play button next to the compile button.
![FlashDevelop](/readme_pictures/flash_develop_compile.png)