package alternativa.tanks.gui.device
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import package_428.UpgradeSaleIcon;
   import package_467.ShopButton;
   
   public class name_3545 extends ShopButton
   {
       
      
      protected var var_3713:Bitmap;
      
      protected var var_3168:Bitmap;
      
      private var var_3714:int;
      
      public function name_3545(param1:int)
      {
         this.var_3713 = UpgradeSaleIcon.method_2908();
         super(new DeviceButtonSkin());
         this.var_3714 = param1;
         this.name_3549();
      }
      
      private function method_3305() : void
      {
         addChildAt(this.var_3713,3);
         this.var_3713.x = 3;
         this.var_3713.y = height - this.var_3713.height - 3;
         this.var_3713.visible = false;
      }
      
      public function name_3549() : void
      {
         this.method_3302();
         buttonMode = false;
         super.method_1476();
      }
      
      public function name_3548() : void
      {
         super.init();
      }
      
      public function name_3546(param1:BitmapData) : void
      {
         if(this.var_3168 != null)
         {
            removeChild(this.var_3168);
         }
         this.var_3168 = new Bitmap(param1);
         this.var_3168.x = width - this.var_3168.width >> 1;
         this.var_3168.y = height - this.var_3168.height >> 1;
         addChildAt(this.var_3168,2);
      }
      
      public function name_3547() : void
      {
         this.name_3546(this.method_3303(this.var_3714));
      }
      
      public function method_3302() : void
      {
         this.name_3546(DevicesIcons.const_2468);
      }
      
      public function method_3304(param1:Boolean) : void
      {
         this.var_3713.visible = param1;
      }
      
      private function method_3303(param1:int) : BitmapData
      {
         switch(param1)
         {
            case 0:
               return DevicesIcons.name_3682;
            case 1:
               return DevicesIcons.name_3684;
            case 2:
               return DevicesIcons.name_3683;
            default:
               throw new Error("Invalid slot index " + param1);
         }
      }
   }
}
