package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import package_37.Vector3;
   import package_405.Tank3D;
   import package_61.name_767;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class TankSkinHull extends TankSkinPart
   {
      
      public static const const_1638:RegExp = /boundbox/i;
      
      public static const const_1639:RegExp = /hull/i;
       
      
      public var var_1722:Vector3;
      
      public var var_1718:Vector.<Mesh>;
      
      public var var_308:name_767;
      
      public var mesh:Mesh;
      
      private var var_1721:EncryptedNumber;
      
      private var var_1719:EncryptedNumber;
      
      private var var_1720:EncryptedNumber;
      
      public function TankSkinHull(param1:Tanks3DSResource)
      {
         this.var_1718 = new Vector.<Mesh>();
         this.var_308 = new name_767();
         super(param1);
         this.method_1893(param1);
         this.method_1894(param1);
         var _loc2_:Vector.<Object3D> = param1.method_766(/mount/i);
         if(_loc2_ == null)
         {
            throw new Error("TurretMountPointNotFoundError");
         }
         var _loc3_:Object3D = _loc2_[0];
         this.var_1722 = new Vector3(_loc3_.x,_loc3_.y,_loc3_.z);
         this.var_1721 = new EncryptedNumberImpl(_loc3_.x);
         this.var_1719 = new EncryptedNumberImpl(_loc3_.y);
         this.var_1720 = new EncryptedNumberImpl(_loc3_.z);
         this.mesh = method_764(this.method_1281(param1));
      }
      
      private function method_1281(param1:Tanks3DSResource) : Mesh
      {
         var _loc2_:Vector.<Object3D> = param1.method_766(/hull/i);
         if(_loc2_ == null)
         {
            throw new Error("Hull mesh not inited");
         }
         return Mesh(_loc2_[0]);
      }
      
      private function method_1893(param1:Tanks3DSResource) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:Mesh = null;
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && !Tank3D.name_2187.test(_loc2_.name))
            {
               _loc3_ = method_764(Mesh(_loc2_));
               this.var_1718.push(_loc3_);
            }
         }
      }
      
      private function method_1894(param1:Tanks3DSResource) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         for each(_loc2_ in param1.objects)
         {
            if(_loc2_ is Mesh && const_1638.test(_loc2_.name))
            {
               _loc3_ = _loc2_;
               break;
            }
         }
         if(_loc3_ == null)
         {
            for each(_loc2_ in param1.objects)
            {
               if(_loc2_ is Mesh && const_1639.test(_loc2_.name))
               {
                  _loc3_ = _loc2_;
                  break;
               }
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_1718[0];
         }
         _loc3_.calculateBounds();
         this.var_308.setSize(_loc3_.boundMinX,_loc3_.boundMinY,_loc3_.boundMinZ,_loc3_.boundMaxX,_loc3_.boundMaxY,_loc3_.boundMaxZ);
      }
      
      public function name_942() : Number
      {
         return this.var_1721.name_900();
      }
      
      public function name_935() : Number
      {
         return this.var_1719.name_900();
      }
      
      public function name_959() : Number
      {
         return this.var_1720.name_900();
      }
   }
}
