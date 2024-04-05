# Rtanks client source codes
Rtanks source code with some modifications (hacks). The code is obfuscated, but i am slowly deobfuscating things that i want to modify. So in future the code will come more readable, but it will never be fully deobfuscated. 

## Compiling
#### Preparing the SDK
You should use flex_sdk_4.6.0.23201 for compiling. It can be found here: https://github.com/JamesMGreene/node-flex-sdk/blob/master/FlexSDKs.md After extracting the SDK, you should replace "SDK_folder/frameworks/libs/air/airglobal.swc" file with "this_repo/tools/airglobal.swc" file. The tools folder is on this repository. Tools folder can be deleted after the swc file is replaced.

#### Configuring Visual Studio Code for compile (recommended, because debugging is easier in vscode)
First install "AS3, MXML and SWF Extension Pack" extension. You can get it here: https://marketplace.visualstudio.com/items?itemName=bowlerhatllc.vscode-nextgenas.

Then download air SDK (https://airsdk.harman.com/download), if you don't have one. Extract it where ever you want.

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
3. Save (:D)
```
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
Now you can compile by clicking the compile button.
![FlashDevelop](/readme_pictures/flash_develop_compile.png)

How to debug? I don't know. Thats why you should use vscode instead.