package package_209
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import alternativa.tanks.gui.notinclan.name_643;
   import base.class_122;
   import flash.text.TextFormatAlign;
   import package_215.name_1871;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ClansListHeader extends class_122
   {
      
      public static var localeService:name_102;
      
      public static var var_1207:Vector.<Number> = Vector.<Number>([0.25,0.1,0.25,0.18,0.22]);
      
      private static var var_1155:Vector.<String>;
      
      private static var var_1158:Number = 2;
       
      
      public function ClansListHeader()
      {
         var _loc1_:name_1871 = null;
         super();
         var_1155 = Vector.<String>([localeService.getText(name_390.const_1379),localeService.getText(name_390.const_1441),localeService.getText(name_390.const_535),localeService.getText(name_390.const_1324),localeService.getText(name_390.const_855)]);
         var _loc2_:int = int(var_1155.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new name_1871(TextFormatAlign.LEFT);
            _loc1_.label = var_1155[_loc3_];
            _loc1_.height = 18;
            _loc1_.y = 1;
            addChild(_loc1_);
            _loc3_++;
         }
         this.resize(name_643.WIDTH - 2 * name_573.const_422);
      }
      
      override public function set width(param1:Number) : void
      {
         this.resize(param1);
      }
      
      protected function resize(param1:Number) : void
      {
         var _loc2_:name_1871 = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = null;
         _loc3_ = int(var_1155.length);
         var _loc4_:Number = var_1158 - 1;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = getChildAt(_loc5_) as name_1871;
            _loc2_.width = var_1207[_loc5_] * (param1 + 2 - var_1158 * (var_1207.length + 1));
            _loc2_.x = _loc4_;
            _loc2_.y = 1;
            if(_loc5_ != _loc3_ - 1)
            {
               _loc4_ += _loc2_.width + var_1158;
            }
            _loc5_++;
         }
         getChildAt(numChildren - 1).width = param1 + 3 - _loc4_ - 2 * var_1158;
      }
   }
}
