package package_296
{
   import alternativa.tanks.models.battlefield.gui.chat.BattleChatUserLabel;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import package_291.name_1099;
   import package_427.class_179;
   import package_427.name_2537;
   import package_67.DamageType;
   
   public class KillMessageOutputLine extends name_2537
   {
      
      private static var var_3052:Class = name_3055;
      
      private static var var_3051:Class = name_3062;
      
      private static var var_3062:Class = name_3054;
      
      private static var var_3061:Class = name_3057;
      
      private static var var_3054:Class = name_3056;
      
      private static var var_3058:Class = name_3063;
      
      private static var var_3055:Class = name_3060;
      
      private static var var_3053:Class = name_3064;
      
      private static var var_3059:Class = name_3065;
      
      private static var var_3056:Class = name_3059;
      
      private static var var_3057:Class = name_3058;
      
      private static var var_3060:Class = name_3066;
      
      private static var var_3050:Dictionary = new Dictionary();
      
      {
         var_3050[DamageType.FIREBIRD] = new var_3052().bitmapData;
         var_3050[DamageType.FIREBIRD_OVERHEAT] = var_3050[DamageType.FIREBIRD];
         var_3050[DamageType.FREEZE] = new var_3051().bitmapData;
         var_3050[DamageType.ISIS] = new var_3062().bitmapData;
         var_3050[DamageType.MINE] = new var_3060().bitmapData;
         var_3050[DamageType.TWINS] = new var_3059().bitmapData;
         var_3050[DamageType.RAILGUN] = new var_3061().bitmapData;
         var_3050[DamageType.RICOCHET] = new var_3054().bitmapData;
         var_3050[DamageType.SHAFT] = new var_3058().bitmapData;
         var_3050[DamageType.SMOKY] = new var_3055().bitmapData;
         var_3050[DamageType.SMOKY_CRITICAL] = var_3050[DamageType.SMOKY];
         var_3050[DamageType.MACHINE_GUN] = new var_3056().bitmapData;
         var_3050[DamageType.SHOTGUN] = new var_3057().bitmapData;
         var_3050[DamageType.THUNDER] = new var_3053().bitmapData;
      }
      
      public function KillMessageOutputLine(param1:name_1099, param2:name_1099, param3:DamageType)
      {
         super();
         this.method_1595(param1,0);
         this.method_2835(param3,6);
         this.method_1595(param2,6);
      }
      
      private function method_1595(param1:name_1099, param2:int) : void
      {
         var _loc3_:BattleChatUserLabel = new name_3061(param1.userId,param1.rank);
         _loc3_.name_2046(class_179.method_2283(param1.teamType),true);
         _loc3_.x = width + param2;
         addChild(_loc3_);
      }
      
      private function method_2835(param1:DamageType, param2:int) : void
      {
         var _loc3_:Bitmap = new Bitmap(var_3050[param1]);
         _loc3_.x = width + param2;
         var_2577.addChild(_loc3_);
      }
   }
}
