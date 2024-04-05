package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.name_1194;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_405.Tank3D;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TurretSkin
   {
      
      public static const var_515:Matrix4 = new Matrix4();
       
      
      protected var var_2026:Vector.<Mesh>;
      
      protected var rootObject:Object3D;
      
      public function TurretSkin(param1:Tanks3DSResource)
      {
         var _loc2_:Object3D = null;
         var _loc3_:Dictionary = null;
         var _loc4_:int = 0;
         var _loc5_:Mesh = null;
         var _loc6_:Mesh = null;
         var _loc7_:Object3DContainer = null;
         var _loc8_:Object3D = null;
         var _loc9_:Object3DContainer = null;
         this.var_2026 = new Vector.<Mesh>();
         super();
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !Tank3D.name_2187.test(_loc2_.name))
            {
               this.var_2026.push(_loc2_);
            }
         }
         _loc3_ = new Dictionary();
         _loc4_ = this.var_2026.length - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_2026[_loc4_];
            _loc6_ = Tank3D.method_734(_loc5_);
            _loc6_.mouseEnabled = false;
            _loc7_ = _loc3_[_loc5_];
            if(_loc7_ != null)
            {
               method_2106(_loc7_,_loc6_);
               _loc7_.addChild(_loc6_);
               name_731(_loc6_,Vector3.ZERO);
            }
            _loc8_ = param1.parents[param1.objects.indexOf(_loc5_)];
            if(_loc8_ != null)
            {
               if(_loc8_ in _loc3_)
               {
                  _loc9_ = _loc3_[_loc8_];
               }
               else
               {
                  _loc9_ = new Object3DContainer();
                  _loc3_[_loc8_] = _loc9_;
               }
               _loc9_.addChild(_loc3_[_loc5_] != null ? _loc3_[_loc5_] : _loc6_);
               _loc9_.mouseEnabled = false;
            }
            this.var_2026[this.var_2026.indexOf(_loc5_)] = _loc6_;
            _loc4_--;
         }
         this.rootObject = this.var_2026[0].parent != null ? this.var_2026[0].parent : this.var_2026[0];
         this.rootObject.name = name_1194.name_1201;
         this.rootObject.mouseEnabled = true;
      }
      
      protected static function method_2106(param1:Object3D, param2:Object3D) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      protected static function name_731(param1:Object3D, param2:Vector3) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      public function name_1204(param1:Shadow) : void
      {
         var _loc2_:Mesh = null;
         for each(_loc2_ in this.var_2026)
         {
            param1.addCaster(_loc2_);
         }
      }
      
      public function set alpha(param1:Number) : void
      {
         this.rootObject.alpha = param1;
      }
      
      public function destroy() : void
      {
         var _loc1_:Mesh = null;
         for each(_loc1_ in this.var_2026)
         {
            _loc1_.setMaterialToAllFaces(null);
         }
         this.var_2026 = null;
      }
      
      public function name_1195(param1:TextureMaterial) : void
      {
         var _loc2_:Mesh = null;
         for each(_loc2_ in this.var_2026)
         {
            _loc2_.setMaterialToAllFaces(param1);
         }
      }
      
      public function method_729(param1:Matrix4, param2:TankSkinHull, param3:Number, param4:Number) : void
      {
         var_515.name_943(param2.var_1722.x,param2.var_1722.y,param2.var_1722.z + 1,0,0,param3);
         var_515.append(param1);
         this.rootObject.x = var_515.m03;
         this.rootObject.y = var_515.m13;
         this.rootObject.z = var_515.m23;
         var _loc5_:Vector3 = BattleUtils.var_351;
         var_515.name_182(_loc5_);
         this.rootObject.rotationX = _loc5_.x;
         this.rootObject.rotationY = _loc5_.y;
         this.rootObject.rotationZ = _loc5_.z;
      }
      
      public function name_144() : Object3D
      {
         return this.rootObject;
      }
      
      public function name_923() : Object3D
      {
         return this.rootObject;
      }
      
      public function method_1281() : Mesh
      {
         return this.var_2026[0];
      }
      
      public function method_2108() : Vector.<Mesh>
      {
         return this.var_2026;
      }
      
      public function name_1196(param1:ColorTransform) : void
      {
         this.rootObject.colorTransform = param1;
      }
   }
}
