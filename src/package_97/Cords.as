package package_97
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   use namespace alternativa3d;
   
   public class Cords extends Mesh
   {
      
      private static var var_2321:Matrix4 = new Matrix4();
       
      
      private var var_2316:BonusMesh;
      
      private var var_2323:int;
      
      private var var_2322:Vector.<Vertex>;
      
      private var var_2325:Vector.<Vector3>;
      
      private var var_2324:Vertex;
      
      private var var_2326:Vector3;
      
      private var parachute:name_1461;
      
      private var var_2312:Number = 1;
      
      private var alphaMultiplier:Number = 1;
      
      public function Cords(param1:Number, param2:Number, param3:int, param4:Material)
      {
         super();
         this.var_2323 = param3;
         this.var_2322 = new Vector.<Vertex>(2 * param3);
         this.var_2325 = new Vector.<Vector3>(param3);
         this.createGeometry(param1,param2);
         setMaterialToAllFaces(param4);
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         name = "cords";
      }
      
      public function init(param1:BonusMesh, param2:name_1461) : *
      {
         this.var_2316 = param1;
         this.parachute = param2;
         scaleX = 1;
         scaleY = 1;
         scaleZ = 1;
         alpha = 1;
      }
      
      public function name_1482() : void
      {
         var _loc1_:Vector3 = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vertex = null;
         if(this.parachute == null)
         {
            return;
         }
         var_2321.name_943(this.parachute.x,this.parachute.y,this.parachute.z,this.parachute.rotationX,this.parachute.rotationY,this.parachute.rotationZ);
         var _loc6_:int = 0;
         while(_loc6_ < this.var_2323)
         {
            _loc1_ = this.var_2325[_loc6_];
            _loc2_ = _loc1_.x * var_2321.m00 + _loc1_.y * var_2321.m01 + _loc1_.z * var_2321.m02 + var_2321.m03;
            _loc3_ = _loc1_.x * var_2321.m10 + _loc1_.y * var_2321.m11 + _loc1_.z * var_2321.m12 + var_2321.m13;
            _loc4_ = _loc1_.x * var_2321.m20 + _loc1_.y * var_2321.m21 + _loc1_.z * var_2321.m22 + var_2321.m23;
            _loc5_ = this.var_2322[2 * _loc6_];
            _loc5_.x = _loc2_;
            _loc5_.y = _loc3_;
            _loc5_.z = _loc4_;
            _loc5_ = this.var_2322[2 * _loc6_ + 1];
            _loc5_.x = _loc2_;
            _loc5_.y = _loc3_;
            _loc5_.z = _loc4_;
            _loc6_++;
         }
         var_2321.name_943(this.var_2316.x,this.var_2316.y,this.var_2316.z,this.var_2316.rotationX,this.var_2316.rotationY,this.var_2316.rotationZ);
         _loc1_ = this.var_2326;
         this.var_2324.x = _loc1_.x * var_2321.m00 + _loc1_.y * var_2321.m01 + _loc1_.z * var_2321.m02 + var_2321.m03;
         this.var_2324.y = _loc1_.x * var_2321.m10 + _loc1_.y * var_2321.m11 + _loc1_.z * var_2321.m12 + var_2321.m13;
         this.var_2324.z = _loc1_.x * var_2321.m20 + _loc1_.y * var_2321.m21 + _loc1_.z * var_2321.m22 + var_2321.m23;
         calculateBounds();
         calculateFacesNormals();
      }
      
      private function createGeometry(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Vector3 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.var_2326 = new Vector3(0,0,param2);
         this.var_2324 = this.createVertex(0,0,param2,0,1);
         var _loc7_:Number = 2 * Math.PI / this.var_2323;
         var _loc8_:int = 0;
         while(_loc8_ < this.var_2323)
         {
            _loc3_ = _loc8_ * _loc7_;
            _loc4_ = new Vector3(param1 * Math.cos(_loc3_),param1 * Math.sin(_loc3_),0);
            this.var_2325[_loc8_] = _loc4_;
            this.var_2322[2 * _loc8_] = this.createVertex(_loc4_.x,_loc4_.y,_loc4_.z,0,0);
            this.var_2322[2 * _loc8_ + 1] = this.createVertex(_loc4_.x,_loc4_.y,_loc4_.z,1,1);
            _loc8_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < this.var_2323)
         {
            _loc5_ = 2 * _loc9_;
            _loc6_ = _loc5_ + 3;
            if(_loc6_ >= 2 * this.var_2323)
            {
               _loc6_ -= 2 * this.var_2323;
            }
            this.method_2349(this.var_2324,this.var_2322[_loc5_],this.var_2322[_loc6_]);
            this.method_2349(this.var_2324,this.var_2322[_loc6_],this.var_2322[_loc5_]);
            _loc9_++;
         }
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
      
      private function method_2349(param1:Vertex, param2:Vertex, param3:Vertex) : Face
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
      
      public function name_1336() : void
      {
         this.var_2316 = null;
         this.parachute = null;
         BonusCache.method_2344(this);
      }
      
      public function name_1068(param1:Number) : void
      {
         this.var_2312 = param1;
         this.method_2342();
      }
      
      private function method_2342() : void
      {
         alpha = this.alphaMultiplier * this.var_2312;
      }
      
      public function name_962(param1:Vector3) : void
      {
         param1.x = x;
         param1.y = y;
         param1.z = z;
      }
      
      public function name_2070(param1:Number) : void
      {
         this.alphaMultiplier = param1;
         this.method_2342();
      }
   }
}
