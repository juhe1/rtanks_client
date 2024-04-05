package package_76
{
   import alternativa.engine3d.core.Camera3D;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_37.name_86;
   
   public class name_735 extends Camera3D
   {
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const const_64:Vector3 = new Vector3();
       
      
      public var pos:Vector3;
      
      public var name_1085:Vector3;
      
      public var var_1442:Vector3;
      
      public var var_1441:Vector3;
      
      public function name_735()
      {
         this.pos = new Vector3();
         this.name_1085 = new Vector3();
         this.var_1442 = new Vector3();
         this.var_1441 = new Vector3();
         super();
         nearClipping = 40;
         farClipping = 200000;
         z = 10000;
         rotationX = -0.01;
         diagramVerticalMargin = 35;
      }
      
      public function name_1241() : void
      {
         var _loc1_:Number = Math.cos(rotationX);
         var _loc2_:Number = Math.sin(rotationX);
         var _loc3_:Number = Math.cos(rotationY);
         var _loc4_:Number = Math.sin(rotationY);
         var _loc5_:Number = Math.cos(rotationZ);
         var _loc6_:Number = Math.sin(rotationZ);
         var _loc7_:Number = _loc5_ * _loc4_;
         var _loc8_:Number = _loc6_ * _loc4_;
         this.name_1085.x = _loc5_ * _loc3_;
         this.var_1442.x = _loc7_ * _loc2_ - _loc6_ * _loc1_;
         this.var_1441.x = _loc7_ * _loc1_ + _loc6_ * _loc2_;
         this.name_1085.y = _loc6_ * _loc3_;
         this.var_1442.y = _loc8_ * _loc2_ + _loc5_ * _loc1_;
         this.var_1441.y = _loc8_ * _loc1_ - _loc5_ * _loc2_;
         this.name_1085.z = -_loc4_;
         this.var_1442.z = _loc3_ * _loc2_;
         this.var_1441.z = _loc3_ * _loc1_;
         this.pos.x = x;
         this.pos.y = y;
         this.pos.z = z;
      }
      
      public function method_1650(param1:Vector3, param2:Vector3) : void
      {
         m.name_932(rotationX,rotationY,rotationZ);
         m.name_890(param1,param2);
      }
      
      public function method_1648(param1:Vector3, param2:Vector3) : void
      {
         m.name_932(rotationX,rotationY,rotationZ);
         m.name_1334(param1,param2);
      }
      
      public function name_731(param1:Vector3) : void
      {
         x = param1.x;
         y = param1.y;
         z = param1.z;
      }
      
      public function method_454(param1:Vector3) : void
      {
         rotationX = param1.x;
         rotationY = param1.y;
         rotationZ = param1.z;
      }
      
      public function method_1651(param1:name_86) : void
      {
         param1.name_182(const_64);
         this.method_454(const_64);
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = x;
         param1.y = y;
         param1.z = z;
      }
      
      public function name_1382(param1:Vector3) : void
      {
         param1.x = rotationX;
         param1.y = rotationY;
         param1.z = rotationZ;
      }
      
      public function method_1649(param1:name_86) : void
      {
         param1.name_222(rotationX,rotationY,rotationZ);
      }
      
      public function name_1235() : void
      {
         fov = name_1258.name_1283(view.width,view.height);
      }
      
      public function name_2072(param1:Number, param2:Number, param3:Number) : void
      {
         rotationX += param1;
         rotationY += param2;
         rotationZ += param3;
      }
   }
}
