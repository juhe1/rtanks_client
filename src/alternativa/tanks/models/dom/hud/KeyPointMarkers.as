package alternativa.tanks.models.dom.hud
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.dom.Point;
   import package_242.name_662;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   use namespace alternativa3d;
   
   public class KeyPointMarkers implements name_1229
   {
      
      private static const const_2226:name_662 = new name_662("ph_scale",0.12,0.00001,10);
      
      private static const const_2228:name_662 = new name_662("pfh_scale",0.1,0.00001,10);
      
      private static const m:Matrix4 = new Matrix4();
      
      private static const m1:Matrix4 = new Matrix4();
      
      private static const v:Vector3 = new Vector3();
      
      private static const const_2227:Vector3 = new Vector3();
      
      private static const var_142:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
       
      
      private var camera:Camera3D;
      
      private var markers:Vector.<name_2231>;
      
      public var battleService:BattlefieldModel;
      
      public function KeyPointMarkers(param1:Camera3D, param2:BattlefieldModel)
      {
         super();
         this.markers = new Vector.<name_2231>();
         this.battleService = param2;
         this.camera = param1;
      }
      
      private static function method_2696(param1:Camera3D, param2:Vector3) : Number
      {
         var _loc3_:Number = Math.cos(param1.rotationX);
         var _loc4_:Number = Math.sin(param1.rotationX);
         var _loc5_:Number = Math.cos(param1.rotationY);
         var _loc6_:Number = Math.sin(param1.rotationY);
         var _loc7_:Number = Math.cos(param1.rotationZ);
         var _loc8_:Number = Math.sin(param1.rotationZ);
         var _loc9_:Number = _loc7_ * _loc6_ * _loc3_ + _loc8_ * _loc4_;
         var _loc10_:Number = -_loc7_ * _loc4_ + _loc6_ * _loc8_ * _loc3_;
         var _loc11_:Number = _loc5_ * _loc3_;
         var _loc12_:Number = -_loc9_ * param1.x - _loc10_ * param1.y - _loc11_ * param1.z;
         var _loc13_:Number = param1.view.width * 0.5;
         var _loc14_:Number = param1.view.height * 0.5;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_) / Math.tan(param1.fov * 0.5);
         var _loc16_:Number = _loc9_ * param2.x + _loc10_ * param2.y + _loc11_ * param2.z + _loc12_;
         return _loc15_ / _loc16_;
      }
      
      private static function method_2695(param1:Object3D) : Matrix4
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc2_:Number = Math.cos(param1.rotationX);
         var _loc3_:Number = Math.sin(param1.rotationX);
         var _loc4_:Number = Math.cos(param1.rotationY);
         _loc5_ = Math.sin(param1.rotationY);
         _loc6_ = Math.cos(param1.rotationZ);
         var _loc7_:Number = Math.sin(param1.rotationZ);
         _loc8_ = _loc6_ * _loc5_;
         _loc9_ = _loc7_ * _loc5_;
         var _loc10_:Number = _loc4_ * param1.scaleX;
         _loc11_ = _loc3_ * param1.scaleY;
         var _loc12_:Number = _loc2_ * param1.scaleY;
         _loc13_ = _loc2_ * param1.scaleZ;
         _loc14_ = _loc3_ * param1.scaleZ;
         m1.m00 = _loc6_ * _loc10_;
         m1.m01 = _loc8_ * _loc11_ - _loc7_ * _loc12_;
         m1.m02 = _loc8_ * _loc13_ + _loc7_ * _loc14_;
         m1.m03 = param1.x;
         m1.m10 = _loc7_ * _loc10_;
         m1.m11 = _loc9_ * _loc11_ + _loc6_ * _loc12_;
         m1.m12 = _loc9_ * _loc13_ - _loc6_ * _loc14_;
         m1.m13 = param1.y;
         m1.m20 = -_loc5_ * param1.scaleX;
         m1.m21 = _loc4_ * _loc11_;
         m1.m22 = _loc4_ * _loc13_;
         m1.m23 = param1.z;
         return m1;
      }
      
      public function show() : void
      {
         var _loc1_:name_2231 = null;
         for each(_loc1_ in this.markers)
         {
            _loc1_.visible = true;
         }
      }
      
      public function name_2237(param1:name_2231) : void
      {
         param1.visible = false;
         this.battleService.var_117.viewport.name_688.addChild(param1);
         this.markers.push(param1);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:name_2231 = null;
         var _loc4_:Matrix4 = this.method_2702();
         for each(_loc3_ in this.markers)
         {
            this.method_2701(_loc3_,_loc4_);
         }
      }
      
      private function method_2701(param1:name_2231, param2:Matrix4) : void
      {
         var _loc3_:Number = NaN;
         param1.name_2881(v);
         var _loc4_:Vector3 = v;
         v.vTransformBy4(param2);
         this.method_2697(v);
         var _loc6_:Number = this.method_2700();
         var _loc7_:Boolean = this.method_2699(v.x,v.y,15,_loc6_);
         if(v.z > 0 && _loc7_)
         {
            _loc3_ = this.method_2698(param1.name_2880());
            if(_loc3_ == 0)
            {
               param1.visible = false;
               param1.alpha = 0;
            }
            else
            {
               param1.visible = true;
               param1.alpha = _loc3_;
            }
         }
         else
         {
            param1.alpha = 1;
            param1.visible = false;
         }
         param1.x = int(v.x + this.battleService.method_168() / 2 - 12);
         param1.y = int(v.y + this.battleService.method_165() / 2 - 12);
         param1.update();
      }
      
      private function method_2698(param1:Point) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:RayIntersectionData = null;
         param1.name_2238(const_2227);
         var _loc5_:Number = method_2696(this.camera,const_2227);
         if(_loc5_ < const_2228.value)
         {
            return 1;
         }
         var_142.reset(this.camera.x,this.camera.y,this.camera.z);
         direction.diff(const_2227,var_142);
         _loc3_ = direction.vLength();
         direction.vNormalize();
         _loc4_ = this.battleService.raycast(var_142,direction,this.battleService.var_117.viewport.getExcludedObjects());
         if(_loc4_ != null && _loc4_.time < _loc3_ - 50)
         {
            _loc2_ = 1;
         }
         else if(_loc5_ > const_2226.value)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = (const_2226.value - _loc5_) / (const_2226.value - const_2228.value);
         }
         return _loc2_;
      }
      
      private function method_2697(param1:Vector3) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.z > 0.001)
         {
            param1.x = param1.x * this.camera.alternativa3d::viewSizeX / param1.z;
            param1.y = param1.y * this.camera.alternativa3d::viewSizeY / param1.z;
         }
         else if(param1.z < -0.001)
         {
            param1.x = -param1.x * this.camera.alternativa3d::viewSizeX / param1.z;
            param1.y = -param1.y * this.camera.alternativa3d::viewSizeY / param1.z;
         }
         else
         {
            _loc2_ = this.battleService.method_204();
            _loc3_ = Math.sqrt(param1.x * param1.x + param1.y * param1.y);
            param1.x *= _loc2_ / _loc3_;
            param1.y *= _loc2_ / _loc3_;
         }
      }
      
      private function method_2700() : int
      {
         switch(this.battleService.screenSize)
         {
            case 10:
               return 70;
            case 9:
               return 40;
            default:
               return 15;
         }
      }
      
      private function method_2699(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Number = this.battleService.method_168() / 2 - param3;
         var _loc6_:Number = this.battleService.method_165() / 2 - param4;
         return param1 >= -_loc5_ && param1 <= _loc5_ && param2 >= -_loc6_ && param2 <= _loc6_;
      }
      
      private function method_2702() : Matrix4
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc1_ = NaN;
         _loc2_ = NaN;
         _loc3_ = NaN;
         _loc4_ = NaN;
         var _loc5_:Number = this.camera.alternativa3d::viewSizeX / this.camera.alternativa3d::focalLength;
         var _loc6_:Number = this.camera.alternativa3d::viewSizeY / this.camera.alternativa3d::focalLength;
         var _loc7_:Number = Math.cos(this.camera.rotationX);
         var _loc8_:Number = Math.sin(this.camera.rotationX);
         _loc1_ = Math.cos(this.camera.rotationY);
         _loc2_ = Math.sin(this.camera.rotationY);
         _loc3_ = Math.cos(this.camera.rotationZ);
         var _loc9_:Number = Math.sin(this.camera.rotationZ);
         var _loc10_:Number = _loc3_ * _loc2_;
         var _loc11_:Number = _loc9_ * _loc2_;
         var _loc12_:Number = _loc1_ * this.camera.scaleX;
         var _loc13_:Number = _loc8_ * this.camera.scaleY;
         var _loc14_:Number = _loc7_ * this.camera.scaleY;
         var _loc15_:Number = _loc7_ * this.camera.scaleZ;
         _loc4_ = _loc8_ * this.camera.scaleZ;
         m.m00 = _loc3_ * _loc12_ * _loc5_;
         m.m01 = (_loc10_ * _loc13_ - _loc9_ * _loc14_) * _loc6_;
         m.m02 = _loc10_ * _loc15_ + _loc9_ * _loc4_;
         m.m03 = this.camera.x;
         m.m10 = _loc9_ * _loc12_ * _loc5_;
         m.m11 = (_loc11_ * _loc13_ + _loc3_ * _loc14_) * _loc6_;
         m.m12 = _loc11_ * _loc15_ - _loc3_ * _loc4_;
         m.m13 = this.camera.y;
         m.m20 = -_loc2_ * this.camera.scaleX * _loc5_;
         m.m21 = _loc1_ * _loc13_ * _loc6_;
         m.m22 = _loc1_ * _loc15_;
         m.m23 = this.camera.z;
         var _loc16_:Object3D = this.camera;
         while(_loc16_.alternativa3d::_parent != null)
         {
            _loc16_ = _loc16_.alternativa3d::_parent;
            m.append(method_2695(_loc16_));
         }
         m.name_1279();
         return m;
      }
   }
}
