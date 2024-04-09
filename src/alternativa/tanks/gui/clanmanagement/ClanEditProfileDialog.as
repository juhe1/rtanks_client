package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.components.name_1956;
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import controls.base.LabelBase;
   import controls.base.name_1890;
   import controls.base.name_1955;
   import controls.dropdownlist.DropDownList;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import package_190.name_571;
   import package_214.FlagsDropDownList;
   import package_228.ClanAction;
   import package_26.ClanInfoUpdateEvent;
   import package_26.name_62;
   import package_275.name_865;
   import package_30.CreateClanServiceEvent;
   import package_30.name_63;
   import package_392.RanksDropDownList;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ClanEditProfileDialog extends name_573
   {
      
      private static const const_1537:String = "country";
      
      private static const const_1536:int = 7829367;
      
      public static const WIDTH:Number = 550;
      
      public static const const_1532:Number = 450;
      
      public static var createClanService:name_63;
      
      public static var clanService:name_62;
      
      public static var localeService:name_102;
       
      
      private var var_1272:name_1955;
      
      private var var_1271:name_1955;
      
      private var var_1279:LabelBase;
      
      private var var_1277:FlagsDropDownList;
      
      private var var_1280:LabelBase;
      
      private var var_1275:DropDownList;
      
      private var var_1281:LabelBase;
      
      private var var_1283:DropDownList;
      
      private var var_1273:name_1956;
      
      private var var_1278:LabelBase;
      
      private var var_1276:name_1890;
      
      private var var_1282:name_571;
      
      private var var_1274:ClanInfoUpdateEvent;
      
      private var var_1284:name_566;
      
      public function ClanEditProfileDialog(param1:name_571, param2:ClanInfoUpdateEvent, param3:name_566)
      {
         super();
         this.var_1282 = param1;
         this.var_1274 = param2;
         this.var_1284 = param3;
         this.init();
         this.resize();
      }
      
      private function init() : void
      {
         this.var_1272 = new name_1955("",true);
         this.var_1272.validateFunction = this.method_1518;
         this.var_1272.maxChars = 15;
         this.var_1272.restrict = "0-9.a-zA-z_\\-*";
         this.var_1272.value = this.getClanName();
         this.var_1272.enable = false;
         this.var_1272.textField.textColor = 7829367;
         addChild(this.var_1272);
         this.var_1271 = new name_1955("",true);
         this.var_1271.validateFunction = this.method_1517;
         this.var_1271.maxChars = 5;
         this.var_1271.restrict = "0-9.a-zA-z_\\-*";
         this.var_1271.value = this.name_1897();
         this.var_1271.enable = false;
         this.var_1271.textField.textColor = 7829367;
         addChild(this.var_1271);
         this.var_1273 = new name_1956(this.method_1519(),clanService.maxCharactersDescription);
         this.var_1273.addEventListener(FocusEvent.FOCUS_IN,this.method_1510);
         this.var_1273.addEventListener(FocusEvent.FOCUS_OUT,this.method_1514);
         addChild(this.var_1273);
         this.var_1278 = new LabelBase();
         this.var_1278.text = localeService.getText(name_390.const_1113);
         this.var_1278.textColor = 7829367;
         this.var_1278.mouseEnabled = false;
         this.var_1278.visible = this.var_1273.text.length == 0;
         this.var_1280 = new LabelBase();
         this.var_1280.text = localeService.getText(name_390.const_1158);
         this.var_1280.mouseEnabled = false;
         addChild(this.var_1280);
         this.var_1275 = new DropDownList();
         this.var_1275.addItem({
            "gameName":localeService.getText(name_390.const_1420),
            "id":0,
            "rang":0
         });
         this.var_1275.addItem({
            "gameName":localeService.getText(name_390.const_1196),
            "id":1,
            "rang":0
         });
         this.var_1275.name_1963(this.requestsEnabled() ? int(0) : int(1));
         this.var_1275.width = 84;
         this.var_1275.height = 75;
         addChild(this.var_1275);
         this.var_1279 = new LabelBase();
         this.var_1279.text = localeService.getText(name_390.const_817);
         addChild(this.var_1279);
         this.var_1281 = new LabelBase();
         this.var_1281.text = localeService.getText(name_390.const_1298);
         this.var_1281.mouseEnabled = false;
         addChild(this.var_1281);
         this.var_1283 = new RanksDropDownList(clanService.minRankForCreateClan);
         this.var_1283.name_1962("rank",this.method_1516());
         this.var_1277 = new FlagsDropDownList();
         this.var_1277.name_1962("country",this.name_1893());
         addChild(this.var_1283);
         addChild(this.var_1277);
         this.var_1276 = new name_1890();
         this.var_1276.label = localeService.getText(name_390.const_1039);
         this.var_1276.addEventListener(MouseEvent.CLICK,this.onOkButtonClick);
         addChild(this.var_1276);
         createClanService.addEventListener(CreateClanServiceEvent.CORRECT_NAME,this.method_1513);
         createClanService.addEventListener(CreateClanServiceEvent.INCORRECT_NAME,this.method_1512);
         createClanService.addEventListener(CreateClanServiceEvent.CORRECT_TAG,this.method_1515);
         createClanService.addEventListener(CreateClanServiceEvent.INCORRECT_TAG,this.method_1511);
      }
      
      private function method_1510(param1:FocusEvent) : void
      {
         this.var_1278.visible = false;
      }
      
      private function method_1514(param1:FocusEvent) : void
      {
         if(this.var_1273.text.length == 0)
         {
            this.var_1278.visible = true;
         }
      }
      
      private function method_1519() : String
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.method_1449();
         }
         return this.var_1274.name_1929;
      }
      
      private function getClanName() : String
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.getClanName();
         }
         return this.var_1274.clanName;
      }
      
      private function name_1897() : String
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.name_1897();
         }
         return this.var_1274.clanTag;
      }
      
      private function name_1893() : name_865
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.name_1893();
         }
         return this.var_1274.name_1881;
      }
      
      private function requestsEnabled() : Boolean
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.incomingRequestEnabled();
         }
         return this.var_1274.name_1961;
      }
      
      private function method_1516() : int
      {
         if(this.var_1274 == null)
         {
            return this.var_1282.method_1452();
         }
         return this.var_1274.name_1957;
      }
      
      private function resize() : void
      {
         this.var_1272.x = 11;
         this.var_1272.y = 11;
         this.var_1272.width = 550 - 2 * 11;
         this.var_1271.x = 11;
         this.var_1271.y = this.var_1272.y + this.var_1272.height + 7;
         this.var_1271.width = 550 - 2 * 11;
         this.var_1279.x = 11;
         this.var_1279.y = this.var_1271.y + this.var_1271.height + 7 + 6;
         this.var_1277.x = this.var_1279.x + this.var_1279.width + 7;
         this.var_1277.y = this.var_1271.y + this.var_1271.height + 7;
         this.var_1280.x = this.var_1277.x + 70 + 7;
         this.var_1280.y = this.var_1279.y;
         this.var_1275.x = this.var_1280.x + this.var_1280.width + 7;
         this.var_1275.y = this.var_1277.y;
         this.var_1281.x = this.var_1275.x + 84 + 7;
         this.var_1281.y = this.var_1279.y;
         this.var_1283.x = this.var_1281.x + this.var_1281.width + 7;
         this.var_1283.y = this.var_1277.y;
         this.var_1276.x = 550 - this.var_1276.width >> 1;
         this.var_1276.y = 450 - this.var_1276.height - 11;
         this.var_1278.x = 7;
         this.var_1278.y = 7;
         this.var_1273.x = 11;
         this.var_1273.y = this.var_1277.y + 30 + 7;
         this.var_1273.width = 550 - 2 * 11;
         this.var_1273.height = 450 - this.var_1273.y - this.var_1276.height - 11 - 7;
      }
      
      override protected function method_1476() : void
      {
         this.var_1273.removeEventListener(FocusEvent.FOCUS_IN,this.method_1510);
         this.var_1273.removeEventListener(FocusEvent.FOCUS_OUT,this.method_1514);
         createClanService.removeEventListener(CreateClanServiceEvent.CORRECT_NAME,this.method_1513);
         createClanService.removeEventListener(CreateClanServiceEvent.INCORRECT_NAME,this.method_1512);
         createClanService.removeEventListener(CreateClanServiceEvent.CORRECT_TAG,this.method_1515);
         createClanService.removeEventListener(CreateClanServiceEvent.INCORRECT_TAG,this.method_1511);
      }
      
      private function method_1509() : void
      {
         if((this.var_1272.name_940() || !this.var_1272.var_466()) && (this.var_1271.name_940() || !this.var_1271.var_466()) && !this.var_1272.name_1958 && !this.var_1271.name_1958)
         {
            this.var_1276.enabled = true;
         }
         else
         {
            this.var_1276.enabled = false;
         }
      }
      
      private function method_1518() : void
      {
         createClanService.method_384(this.var_1272.value);
      }
      
      private function method_1517() : void
      {
         createClanService.method_378(this.var_1271.value);
      }
      
      private function method_1513(param1:CreateClanServiceEvent) : void
      {
         this.var_1272.name_1960();
         this.method_1509();
      }
      
      private function method_1512(param1:CreateClanServiceEvent) : void
      {
         this.var_1272.name_1959();
         this.method_1509();
      }
      
      private function method_1515(param1:CreateClanServiceEvent) : void
      {
         this.var_1271.name_1960();
         this.method_1509();
      }
      
      private function method_1511(param1:CreateClanServiceEvent) : void
      {
         this.var_1271.name_1959();
         this.method_1509();
      }
      
      private function onOkButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:ClanInfoUpdateEvent = new ClanInfoUpdateEvent();
         var _loc3_:name_865 = this.var_1277.selectedItem["country"];
         var _loc4_:int = int(this.var_1283.selectedItem.rank);
         _loc2_.clanName = this.var_1272.value;
         _loc2_.clanTag = this.var_1271.value;
         _loc2_.name_1881 = _loc3_;
         _loc2_.name_1961 = this.var_1275.selectedItem.id == 0;
         _loc2_.name_1957 = _loc4_;
         _loc2_.name_1929 = this.var_1273.text;
         clanService.method_353(this.var_1273.text,_loc4_,_loc3_,this.var_1275.selectedItem.id == 0);
         this.var_1284.method_1468(_loc2_);
         destroy();
      }
      
      override public function method_1459() : void
      {
         if(!clanUserInfoService.method_375(ClanAction.EDIT_PROFILE))
         {
            destroy();
         }
      }
      
      override public function get height() : Number
      {
         return 450;
      }
      
      override public function get width() : Number
      {
         return 550;
      }
      
      override protected function method_1477() : String
      {
         return name_390.const_969;
      }
   }
}
