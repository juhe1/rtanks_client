package alternativa.tanks.model.shop
{
   import controls.base.DefaultButtonBase;
   import controls.name_1922;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_125.PromoPackageItem;
   import package_125.name_2908;
   import package_447.name_2906;
   import package_448.PaymentBugReportBlock;
   import package_449.CrystalPackageItem;
   import package_450.LootBoxPackageItem;
   import package_451.PremiumPackageItem;
   import package_452.BattlePassPackageButton;
   import package_453.NewbieKitPackageButton;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ShopWindow extends Sprite
   {
      
      public static var localeService:name_102 = Main.osgi.getService(name_102) as name_102;
      
      public static const const_2244:int = 11;
      
      public static const const_2245:int = 7;
      
      public static var name_2252:Boolean = false;
       
      
      private var var_2894:int;
      
      private var var_2892:name_1922;
      
      private var var_2891:name_2906;
      
      private var categories:ShopCategorysView;
      
      private var var_2893:PaymentBugReportBlock;
      
      public var header:ShopWindowHeader;
      
      private var name_983:DefaultButtonBase;
      
      public function ShopWindow()
      {
         this.var_2892 = new name_1922();
         this.categories = new ShopCategorysView();
         this.header = new ShopWindowHeader();
         super();
         addChild(this.var_2892);
         this.var_2892.width = 915;
         this.var_2892.height = 691;
         this.header.x = 11;
         this.header.y = 11;
         this.header.resize(915 - 11 * 2);
         this.name_983 = new DefaultButtonBase();
         this.name_983.tabEnabled = false;
         this.name_983.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.name_983.x = this.var_2892.width - this.name_983.width - 2 * 11;
         this.name_983.y = this.var_2892.height - this.name_983.height - 11;
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_2724);
         addChild(this.name_983);
         this.var_2893 = new PaymentBugReportBlock();
         this.var_2893.x = 11;
         this.var_2893.y = this.name_983.y - 11 - this.var_2893.height;
         this.var_2893.width = this.var_2892.width - 11 - this.var_2893.x;
         addChild(this.var_2893);
         this.var_2892.addChild(this.categories);
         this.var_2894 = numChildren;
         this.var_2892.addChild(this.header);
         this.categories.x = 11;
         this.categories.y = this.header.y + this.header.height + 7 - 2;
      }
      
      private function method_2724(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function name_2251(param1:String, param2:String, param3:String) : void
      {
         this.categories.name_2251(new name_2907(param1,param2,param3));
         this.categories.render(this.var_2892.width - 11 * 2,this.var_2893.y - this.categories.y - 11);
      }
      
      public function addItem(param1:String, param2:String, param3:Object) : void
      {
         if(param2.indexOf("crystal") >= 0)
         {
            this.categories.addItem(param1,new CrystalPackageItem(param2,param3));
         }
         else if(param2.indexOf("promocode") >= 0)
         {
            this.categories.addItem(param1,new PromoPackageItem(param2,param3));
         }
         else if(param2.indexOf("lootbox") >= 0)
         {
            this.categories.addItem(param1,new LootBoxPackageItem(param2,param3));
         }
         else if(param2.indexOf("battlepass") >= 0)
         {
            this.categories.addItem(param1,new BattlePassPackageButton(param2,param3));
         }
         else if(param2.indexOf("special") >= 0)
         {
            this.categories.addItem(param1,new NewbieKitPackageButton(param2,param3));
         }
         else
         {
            this.categories.addItem(param1,new PremiumPackageItem(param2,param3));
         }
         this.categories.render(this.var_2892.width - 11 * 2,this.var_2893.y - this.categories.y - 11);
      }
      
      public function method_2722(param1:MouseEvent) : void
      {
         if(Boolean(this.var_2891) && contains(this.var_2891))
         {
            removeChild(this.var_2891);
            this.var_2891.destroy();
            this.var_2891 = null;
         }
         this.categories.visible = true;
         this.header.name_2905.visible = false;
         this.header.name_2250.visible = true;
         this.header.name_2905.removeEventListener(MouseEvent.CLICK,this.method_2722);
      }
      
      public function method_2723(param1:name_2906) : void
      {
         if(Boolean(this.var_2891) && contains(this.var_2891))
         {
            removeChild(this.var_2891);
            this.var_2891.destroy();
         }
         this.var_2891 = param1;
         this.var_2891.window = this;
         addChildAt(this.var_2891,this.var_2894 - 1);
         this.categories.visible = false;
         this.header.name_2905.visible = true;
         this.header.name_2250.visible = false;
         this.header.name_2905.addEventListener(MouseEvent.CLICK,this.method_2722);
         this.render();
         this.var_2891.name_2909();
      }
      
      public function get method_2725() : name_2906
      {
         return this.var_2891;
      }
      
      public function render(param1:Event = null) : void
      {
         if(Boolean(this.var_2891))
         {
            this.var_2891.x = 11;
            this.var_2891.y = this.header.y + this.header.height;
            this.var_2891.render(this.var_2892.width - 11 * 2,this.var_2893.y - this.var_2891.y - 3);
         }
      }
      
      public function name_2249(param1:name_2908) : void
      {
         this.method_2723(param1);
      }
   }
}
