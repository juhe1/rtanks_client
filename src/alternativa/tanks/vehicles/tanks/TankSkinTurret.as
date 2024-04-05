package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import package_37.Vector3;
   import package_405.Tank3D;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkinTurret extends TankSkinPart
   {
      
      private static const const_1784:RegExp = /box.*/i;
      
      private static const const_1785:RegExp = /(launcher_.?|barrel_.?)/i;
       
      
      public var name_1434:Vector3;
      
      public var name_963:Vector3;
      
      public var name_929:Vector3;
      
      public var var_1718:Vector.<Mesh>;
      
      public var muzzles:Vector.<Vector3>;
      
      private var var_2028:Vector.<name_907>;
      
      public function TankSkinTurret(param1:Tanks3DSResource)
      {
         this.var_1718 = new Vector.<Mesh>();
         super(param1);
         this.method_1893(param1);
         this.var_2028 = this.method_2112(param1);
         this.name_1434 = method_2111(param1);
         this.name_963 = this.method_2113(param1);
         this.muzzles = this.method_1026(param1);
         this.name_929 = this.muzzles[0];
      }
      
      private static function method_2111(param1:Tanks3DSResource) : Vector3
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = param1.method_766(/fmnt.*/i);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_[0];
            return new Vector3(_loc2_.x,_loc2_.y,_loc2_.z);
         }
         throw new Error();
      }
      
      private function method_2113(param1:Tanks3DSResource) : Vector3
      {
         var _loc2_:Object3D = null;
         var _loc3_:Vector.<Object3D> = param1.method_766(/laser/i);
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_[0];
            return new Vector3(_loc2_.x,_loc2_.y,_loc2_.z + 5);
         }
         return this.name_929;
      }
      
      private function method_1893(param1:Tanks3DSResource) : void
      {
         var _loc2_:Object3D = null;
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !Tank3D.name_2187.test(_loc2_.name))
            {
               this.var_1718.push(method_764(Mesh(_loc2_)));
            }
         }
      }
      
      private function method_2112(param1:Tanks3DSResource) : Vector.<name_907>
      {
         var _loc2_:Object3D = null;
         var _loc3_:Mesh = null;
         var _loc4_:Vector.<Object3D> = param1.method_766(const_1784);
         var _loc5_:Vector.<name_907> = new Vector.<name_907>();
         if(_loc4_ != null && _loc4_.length != 0)
         {
            for each(_loc2_ in _loc4_)
            {
               _loc5_.push(new name_907(_loc2_));
            }
         }
         else
         {
            for each(_loc3_ in this.var_1718)
            {
               _loc5_.push(new name_907(_loc3_));
            }
         }
         return _loc5_;
      }
      
      private function method_1026(param1:Tanks3DSResource) : Vector.<Vector3>
      {
         var parent:Object3D = null;
         var object:Object3D = null;
         var muzzle:Vector3 = null;
         parent = null;
         var resource:Tanks3DSResource = param1;
         var muzzles:Vector.<Vector3> = new Vector.<Vector3>();
         var objects:Vector.<Object3D> = resource.method_766(/muzzle.*/);
         if(objects != null)
         {
            objects.sort(function(param1:Object3D, param2:Object3D):Number
            {
               if(param1.name <= param2.name)
               {
                  return -1;
               }
               return 1;
            });
            for each(object in objects)
            {
               muzzle = new Vector3(object.x,object.y,object.z);
               parent = resource.parents[resource.objects.indexOf(object)];
               if(parent != null && Boolean(parent.name.match(const_1785)))
               {
                  muzzle.x += parent.x;
                  muzzle.y += parent.y;
                  muzzle.z += parent.z;
               }
               muzzles.push(muzzle);
            }
            return muzzles;
         }
         throw new Error();
      }
      
      public function name_1197() : Vector.<name_907>
      {
         return this.var_2028;
      }
   }
}
