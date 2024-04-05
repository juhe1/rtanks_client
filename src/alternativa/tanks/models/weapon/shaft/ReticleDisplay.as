package alternativa.tanks.models.weapon.shaft
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.BattleView3D;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.utils.Colorizer;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_71.LaserPointerEffect;
   import package_76.name_735;
   
   use namespace alternativa3d;
   
   public class ReticleDisplay extends Sprite
   {
      
      public static var battleService:name_83;
      
      private static var var_625:Dictionary = new Dictionary();
       
      
      private var var_624:Bitmap;
      
      private var var_623:Bitmap;
      
      private var var_626:uint;
      
      public function ReticleDisplay(param1:BitmapData, param2:uint)
      {
         super();
         this.var_626 = param2;
         this.method_868(param1);
         this.var_623 = this.method_867(param2);
         addChild(this.var_624);
         addChild(this.var_623);
         this.var_623.x = (this.var_624.width - this.var_623.width) / 2;
         this.var_623.y = (this.var_624.height - this.var_623.height) / 2;
         mouseEnabled = false;
      }
      
      public function method_873(param1:Number) : void
      {
         this.var_623.width = LaserPointerEffect.name_1330.width * param1;
         this.var_623.height = LaserPointerEffect.name_1330.height * param1;
         this.var_623.x = (this.var_624.width - this.var_623.width) / 2;
         this.var_623.y = (this.var_624.height - this.var_623.height) / 2;
      }
      
      public function method_872(param1:uint) : void
      {
         var _loc2_:Bitmap = null;
         _loc2_ = null;
         if(this.var_626 != param1)
         {
            _loc2_ = this.method_867(param1);
            addChild(_loc2_);
            _loc2_.x = this.var_623.x;
            _loc2_.y = this.var_623.y;
            _loc2_.width = this.var_623.width;
            _loc2_.height = this.var_623.height;
            removeChild(this.var_623);
            this.var_623 = _loc2_;
            this.var_626 = param1;
         }
      }
      
      private function method_868(param1:BitmapData) : void
      {
         this.var_624 = new Bitmap(param1);
      }
      
      private function method_867(param1:uint) : Bitmap
      {
         var _loc2_:Bitmap = var_625[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.method_869(param1);
            var_625[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function method_869(param1:uint) : Bitmap
      {
         var _loc2_:BitmapData = Colorizer.name_1332(LaserPointerEffect.name_1330,param1,0.75);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.smoothing = true;
         return _loc3_;
      }
      
      public function method_870() : void
      {
         if(stage != null)
         {
            x = stage.stageWidth - width >> 1;
            y = stage.stageHeight - height >> 1;
         }
      }
      
      public function method_871(param1:Vector3) : void
      {
         var _loc12_:Number = NaN;
         var _loc2_:BattleView3D = null;
         var _loc3_:name_735 = battleService.getBattlefieldData().viewport.camera;
         var _loc4_:Number = Number(_loc3_.alternativa3d::focalLength);
         var _loc5_:Number = Number(_loc3_.alternativa3d::viewSizeX);
         var _loc6_:Number = Number(_loc3_.alternativa3d::viewSizeY);
         var _loc7_:Number = Math.atan((_loc6_ + height / 2) / _loc4_);
         var _loc8_:Number = Math.atan((_loc5_ + width / 2) / _loc4_);
         var _loc9_:Matrix3 = BattleUtils.name_1331;
         _loc9_.name_1333(_loc3_);
         var _loc10_:Vector3 = BattleUtils.var_351;
         _loc9_.name_1334(param1,_loc10_);
         var _loc11_:Number = Math.atan2(_loc10_.x,_loc10_.z);
         _loc12_ = Math.atan2(_loc10_.y,_loc10_.z);
         visible = Math.abs(_loc12_) <= _loc7_ && Math.abs(_loc11_) <= _loc8_;
         if(visible)
         {
            _loc2_ = battleService.getBattlefieldData().viewport;
            x = _loc2_.x + Math.tan(_loc11_) * _loc4_ + _loc5_ - width / 2;
            y = _loc2_.y + Math.tan(_loc12_) * _loc4_ + _loc6_ - height / 2;
         }
      }
   }
}
