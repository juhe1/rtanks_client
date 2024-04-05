package package_165
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.FillMaterial;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_657;
   import flash.display.BlendMode;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix3;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   use namespace alternativa3d;
   
   public class ThunderShotEffect extends class_30 implements name_657
   {
      
      private static const speed1:Number = 500;
      
      private static const speed2:Number = 1000;
      
      private static const speed3:Number = 1500;
      
      private static const raySpeed1:Number = 1500;
      
      private static const raySpeed2:Number = 2500;
      
      private static const raySpeed3:Number = 1300;
      
      private static var var_2535:Vector3 = new Vector3();
      
      private static var direction:Vector3 = new Vector3();
      
      private static var axis:Vector3 = new Vector3();
      
      private static var const_64:Vector3 = new Vector3();
      
      private static var var_2536:FillMaterial = new FillMaterial(4294753806);
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var var_2534:Matrix3 = new Matrix3();
      
      private static var trailMatrix2:Matrix3 = new Matrix3();
       
      
      private var turret:Object3D;
      
      private var var_2537:Vector3;
      
      private var sprite1:Sprite3D;
      
      private var sprite2:Sprite3D;
      
      private var sprite3:Sprite3D;
      
      private var ray1:Trail;
      
      private var ray2:Trail;
      
      private var ray3:Trail;
      
      private var distance1:Number = 40;
      
      private var distance2:Number = 75;
      
      private var distance3:Number = 80;
      
      private var rayDistance1:Number = 0;
      
      private var rayDistance2:Number = 0;
      
      private var rayDistance3:Number = 0;
      
      private var angle1:Number;
      
      private var angle2:Number;
      
      private var angle3:Number;
      
      private var var_750:int;
      
      public function ThunderShotEffect(param1:ObjectPool)
      {
         super(param1);
         this.method_2511();
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Material) : void
      {
         this.turret = param1;
         this.var_2537 = param2;
         this.sprite1.material = param3;
         this.sprite2.material = param3;
         this.sprite3.material = param3;
         this.var_750 = 50;
         this.distance1 = 40;
         this.distance2 = 75;
         this.distance3 = 80;
         this.rayDistance1 = 0;
         this.rayDistance2 = 0;
         this.rayDistance3 = 0;
         this.angle1 = Math.random() * 2 * Math.PI;
         this.angle2 = Math.random() * 2 * Math.PI;
         this.angle3 = Math.random() * 2 * Math.PI;
      }
      
      public function name_742(param1:name_175) : void
      {
         param1.addChild(this.sprite1);
         param1.addChild(this.sprite2);
         param1.addChild(this.sprite3);
         param1.addChild(this.ray1);
         param1.addChild(this.ray2);
         param1.addChild(this.ray3);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.var_750 < 0)
         {
            return false;
         }
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         var_515.name_890(this.var_2537,var_2535);
         direction.x = var_515.m01;
         direction.y = var_515.m11;
         direction.z = var_515.m21;
         var _loc3_:Number = 0.001 * param1;
         this.rayDistance1 += _loc3_ * 1500;
         this.rayDistance2 += _loc3_ * 2500;
         this.rayDistance3 += _loc3_ * 1300;
         this.method_2510(this.sprite1,var_2535,direction,this.distance1);
         this.method_2510(this.sprite2,var_2535,direction,this.distance2);
         this.method_2510(this.sprite3,var_2535,direction,this.distance3);
         this.method_2508(this.ray1,this.angle1,var_2535,direction,this.rayDistance1,0,10);
         this.method_2508(this.ray2,this.angle2,var_2535,direction,this.rayDistance2,-7,0);
         this.method_2508(this.ray3,this.angle3,var_2535,direction,this.rayDistance3,7,0);
         this.distance1 += _loc3_ * 500;
         this.distance2 += _loc3_ * 1000;
         this.distance3 += _loc3_ * 1500;
         this.var_750 -= param1;
         return true;
      }
      
      public function destroy() : void
      {
         this.sprite1.alternativa3d::removeFromParent();
         this.sprite2.alternativa3d::removeFromParent();
         this.sprite3.alternativa3d::removeFromParent();
         this.ray1.alternativa3d::removeFromParent();
         this.ray2.alternativa3d::removeFromParent();
         this.ray3.alternativa3d::removeFromParent();
         method_584();
      }
      
      public function kill() : void
      {
         this.var_750 = -1;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      override protected function getClass() : Class
      {
         return ThunderShotEffect;
      }
      
      private function method_2511() : void
      {
         this.sprite1 = this.method_2509(120);
         this.sprite2 = this.method_2509(99.75);
         this.sprite3 = this.method_2509(79.5);
         this.ray1 = new Trail(0.8,var_2536);
         this.ray2 = new Trail(0.75,var_2536);
         this.ray3 = new Trail(0.82,var_2536);
      }
      
      private function method_2509(param1:Number) : Sprite3D
      {
         var _loc2_:Sprite3D = new Sprite3D(param1,param1);
         _loc2_.rotation = 2 * Math.PI * Math.random();
         _loc2_.blendMode = BlendMode.SCREEN;
         return _loc2_;
      }
      
      private function method_2510(param1:Sprite3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param3.x * param4;
         param1.y = param2.y + param3.y * param4;
         param1.z = param2.z + param3.z * param4;
      }
      
      private function method_2508(param1:Mesh, param2:Number, param3:Vector3, param4:Vector3, param5:Number, param6:Number, param7:Number) : void
      {
         var_2534.name_1097(Vector3.Y_AXIS,param2);
         if(param4.y < -0.99999 || param4.y > 0.99999)
         {
            axis.x = 0;
            axis.y = 0;
            axis.z = 1;
            param2 = param4.y < 0 ? Number(Math.PI) : Number(0);
         }
         else
         {
            axis.x = param4.z;
            axis.y = 0;
            axis.z = -param4.x;
            axis.vNormalize();
            param2 = Math.acos(param4.y);
         }
         trailMatrix2.name_1097(axis,param2);
         var_2534.append(trailMatrix2);
         var_2534.name_182(const_64);
         param1.rotationX = const_64.x;
         param1.rotationY = const_64.y;
         param1.rotationZ = const_64.z;
         param1.x = param3.x + param4.x * param5 + param6 * var_2534.m00 + param7 * var_2534.m02;
         param1.y = param3.y + param4.y * param5 + param6 * var_2534.m10 + param7 * var_2534.m12;
         param1.z = param3.z + param4.z * param5 + param6 * var_2534.m20 + param7 * var_2534.m22;
      }
   }
}

import alternativa.engine3d.alternativa3d;
import alternativa.engine3d.core.Face;
import alternativa.engine3d.core.Vertex;
import alternativa.engine3d.core.Wrapper;
import alternativa.engine3d.materials.Material;
import alternativa.engine3d.objects.Mesh;
import flash.display.BlendMode;

use namespace alternativa3d;

class Trail extends Mesh
{
    
   
   public function Trail(param1:Number, param2:Material)
   {
      super();
      var _loc4_:Number = 240 * param1;
      var _loc5_:Vertex = this.createVertex(-4,0,0,0,0);
      var _loc6_:Vertex = this.createVertex(4,0,0,0,1);
      var _loc7_:Vertex = this.createVertex(0,_loc4_,0,1,0.5);
      this.createFace(_loc5_,_loc6_,_loc7_).material = param2;
      this.createFace(_loc7_,_loc6_,_loc5_).material = param2;
      calculateFacesNormals(true);
      calculateBounds();
      blendMode = BlendMode.SCREEN;
      alpha = 0.3;
   }
   
   private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
   {
      var _loc6_:Vertex = new Vertex();
      _loc6_.alternativa3d::next = alternativa3d::vertexList;
      alternativa3d::vertexList = _loc6_;
      _loc6_.x = param1;
      _loc6_.y = param2;
      _loc6_.z = param3;
      _loc6_.u = param4;
      _loc6_.v = param5;
      return _loc6_;
   }
   
   private function createFace(param1:Vertex, param2:Vertex, param3:Vertex) : Face
   {
      var _loc4_:Face = new Face();
      _loc4_.alternativa3d::next = alternativa3d::faceList;
      alternativa3d::faceList = _loc4_;
      _loc4_.alternativa3d::wrapper = new Wrapper();
      _loc4_.alternativa3d::wrapper.alternativa3d::vertex = param1;
      _loc4_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
      _loc4_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
      _loc4_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
      _loc4_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
      return _loc4_;
   }
}
