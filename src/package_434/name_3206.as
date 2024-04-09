package package_434
{
   import controls.buttons.class_201;
   import flash.display.Bitmap;
   import package_1.Main;
   import package_433.ItemViewCategoryEnum;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_3206 extends class_201
   {
      
      public static var localeService:name_102 = Main.osgi.getService(name_102) as name_102;
      
      public static const const_2763:Class = name_3527;
      
      public static const const_2762:Class = name_3529;
      
      public static const const_2766:Class = name_3525;
      
      public static const const_2760:Class = name_3528;
      
      public static const const_2759:Class = name_3522;
      
      public static const const_2761:Class = name_3524;
      
      public static const const_2764:Class = name_3526;
      
      public static const const_2765:Class = name_3523;
      
      public static const name_2097:Class = name_3520;
      
      private static const const_2433:Class = name_3521;
       
      
      private var category:ItemViewCategoryEnum;
      
      private var var_3600:Bitmap;
      
      private var _width:int;
      
      public function name_3206(param1:ItemViewCategoryEnum)
      {
         var _loc2_:String = null;
         var _loc3_:Class = null;
         this.var_3600 = new const_2764();
         switch(param1)
         {
            case ItemViewCategoryEnum.SPECIAL:
               _loc2_ = String(localeService.getText(name_390.const_961));
               _loc3_ = const_2763;
               break;
            case ItemViewCategoryEnum.WEAPON:
               _loc2_ = String(localeService.getText(name_390.const_1065));
               _loc3_ = const_2762;
               break;
            case ItemViewCategoryEnum.ARMOR:
               _loc2_ = String(localeService.getText(name_390.const_1345));
               _loc3_ = const_2766;
               break;
            case ItemViewCategoryEnum.PAINT:
               _loc2_ = String(localeService.getText(name_390.const_926));
               _loc3_ = const_2760;
               break;
            case ItemViewCategoryEnum.KIT:
               _loc2_ = String(localeService.getText(name_390.const_1361));
               _loc3_ = const_2759;
               break;
            case ItemViewCategoryEnum.INVENTORY:
               _loc2_ = String(localeService.getText(name_390.const_1261));
               _loc3_ = const_2761;
               break;
            case ItemViewCategoryEnum.RESISTANCE:
               _loc2_ = String(localeService.getText(name_390.const_1084));
               _loc3_ = name_2097;
               break;
            case ItemViewCategoryEnum.GIVEN_PRESENTS:
               _loc2_ = String(localeService.getText(name_390.const_984));
               _loc3_ = const_2765;
               break;
            case ItemViewCategoryEnum.DRONE:
               _loc2_ = "Drones";
               _loc3_ = const_2433;
         }
         super(_loc2_,_loc3_);
         enabled = true;
         this.category = param1;
         addChild(this.var_3600);
         this.var_3600.y = -5;
         this.var_3600.visible = false;
         method_2896();
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         return this.category;
      }
      
      public function name_3209() : void
      {
         icon.visible = true;
         _label.visible = false;
         this.width = 30;
      }
      
      public function name_3207() : void
      {
         icon.visible = false;
         _label.visible = true;
         this.width = 6 + _label.width + 6;
      }
      
      public function name_3208() : void
      {
         icon.visible = true;
         _label.visible = true;
         this.width = 27 + _label.width + 6;
      }
      
      public function showDiscountIndicator() : void
      {
         this.var_3600.visible = true;
      }
      
      public function hideDiscountIndicator() : void
      {
         this.var_3600.visible = false;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         if(_label.visible)
         {
            if(Boolean(icon) && icon.visible)
            {
               _label.x = 21 + (this._width - 21 - _label.width >> 1);
            }
            else
            {
               _label.x = this._width - _label.width >> 1;
            }
         }
         this.var_3600.x = param1 - (this.var_3600.width >> 1) - 4;
         super.width = this._width;
      }
   }
}
