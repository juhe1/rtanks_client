package alternativa.tanks.models.dom.hud
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.utils.name_75;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class ProgressPlane extends Mesh
   {
      
      private static const const_414:Number = 100;
       
      
      private var progress:Number = 0;
      
      private var var_2144:Material;
      
      private var var_2145:Material;
      
      private var var_2148:Material;
      
      private var var_2147:Material;
      
      private var var_2146:Material;
      
      private var var_2142:Vector.<Face>;
      
      private var uvs:Vector.<Point>;
      
      private var var_2143:Vector.<Vector3D>;
      
      public function ProgressPlane(param1:Number, param2:Number, param3:Material, param4:Material, param5:Material, param6:Material, param7:Material)
      {
         this.uvs = new Vector.<Point>();
         this.var_2143 = new Vector.<Vector3D>();
         super();
         this.var_2144 = param3;
         this.var_2145 = param4;
         this.var_2148 = param5;
         this.var_2147 = param6;
         this.var_2146 = param7;
         useShadowMap = false;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         this.createGeometry(param1,param2);
      }
      
      private function createGeometry(param1:Number, param2:Number) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Number = param1 * 0.5;
         var _loc7_:Number = param2 * 0.5;
         this.var_2143[0] = new Vector3D(0,_loc7_,0);
         this.var_2143[1] = new Vector3D(-_loc6_,0,0);
         this.var_2143[2] = new Vector3D(0,-_loc7_,0);
         this.var_2143[3] = new Vector3D(_loc6_,0,0);
         this.uvs[0] = new Point(0.5,-0.5);
         this.uvs[1] = new Point(-0.5,0.5);
         this.uvs[2] = new Point(0.5,1.5);
         this.uvs[3] = new Point(1.5,0.5);
         this.var_2142 = new Vector.<Face>();
         _loc3_ = this.createVertex(-_loc6_,0,0,-0.5,0.5);
         _loc4_ = this.createVertex(0,0,0,0.5,0.5);
         _loc5_ = this.createVertex(0,_loc7_,0,0.5,-0.5);
         this.var_2142[0] = this.createFace(_loc3_,_loc4_,_loc5_,this.var_2144);
         _loc3_ = this.createVertex(0,-_loc7_,0,0.5,1.5);
         _loc4_ = this.createVertex(0,0,0,0.5,0.5);
         _loc5_ = this.createVertex(-_loc6_,0,0,-0.5,0.5);
         this.var_2142[1] = this.createFace(_loc3_,_loc4_,_loc5_,this.var_2144);
         _loc3_ = this.createVertex(_loc6_,0,0,1.5,0.5);
         _loc4_ = this.createVertex(0,0,0,0.5,0.5);
         _loc5_ = this.createVertex(0,-_loc7_,0,0.5,1.5);
         this.var_2142[2] = this.createFace(_loc3_,_loc4_,_loc5_,this.var_2144);
         _loc3_ = this.createVertex(0,_loc7_,0,0.5,-0.5);
         _loc4_ = this.createVertex(0,0,0,0.5,0.5);
         _loc5_ = this.createVertex(_loc6_,0,0,1.5,0.5);
         this.var_2142[3] = this.createFace(_loc3_,_loc4_,_loc5_,this.var_2144);
         _loc3_ = this.createVertex(0,0,0,0,0);
         _loc4_ = this.createVertex(0,0,0,0.5,0.5);
         _loc5_ = this.createVertex(0,0,0,0,0);
         this.var_2142[4] = this.createFace(_loc3_,_loc4_,_loc5_,this.var_2144);
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _loc6_:Vertex = new Vertex();
         _loc6_.x = param1;
         _loc6_.y = param2;
         _loc6_.z = param3;
         _loc6_.u = param4;
         _loc6_.v = param5;
         _loc6_.alternativa3d::next = alternativa3d::vertexList;
         alternativa3d::vertexList = _loc6_;
         return _loc6_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material) : Face
      {
         var _loc5_:Face = null;
         _loc5_ = new Face();
         _loc5_.material = param4;
         _loc5_.alternativa3d::wrapper = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc5_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc5_.alternativa3d::normalX = 0;
         _loc5_.alternativa3d::normalY = 0;
         _loc5_.alternativa3d::normalZ = 1;
         _loc5_.alternativa3d::offset = 0;
         _loc5_.alternativa3d::next = alternativa3d::faceList;
         alternativa3d::faceList = _loc5_;
         return _loc5_;
      }
      
      public function name_1315(param1:Camera3D) : void
      {
         rotationX = param1.rotationX - Math.PI;
         rotationY = 0;
         rotationZ = param1.rotationZ;
      }
      
      public function method_284(param1:Number) : void
      {
         var _loc2_:Number = name_75.method_218(param1,-100,100);
         if(this.progress != _loc2_)
         {
            this.progress = _loc2_;
            this.update();
         }
      }
      
      private function update() : void
      {
         var _loc1_:Face = null;
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vector3D = null;
         var _loc5_:Vector3D = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Face = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = this.progress / 100;
         var _loc14_:Number = Math.abs(_loc13_);
         var _loc15_:int = 4 * _loc14_;
         var _loc16_:int = (_loc15_ + 1) % 4;
         var _loc17_:Material = _loc13_ < 0 ? this.var_2147 : this.var_2145;
         var _loc18_:Material = _loc13_ < 0 ? this.var_2146 : this.var_2148;
         var _loc19_:int = 0;
         while(_loc19_ < 4)
         {
            _loc1_ = this.var_2142[_loc19_];
            if(_loc19_ < _loc15_)
            {
               _loc1_.material = _loc14_ == 1 ? _loc18_ : _loc17_;
            }
            else if(_loc19_ > _loc15_)
            {
               _loc1_.material = this.var_2144;
            }
            _loc2_ = _loc1_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc9_ = (_loc19_ + 1) % 4;
            _loc5_ = this.var_2143[_loc9_];
            _loc7_ = this.uvs[_loc9_];
            _loc2_.x = _loc5_.x;
            _loc2_.y = _loc5_.y;
            _loc2_.u = _loc7_.x;
            _loc2_.v = _loc7_.y;
            _loc19_++;
         }
         _loc8_ = this.var_2142[4];
         if(_loc14_ == 1)
         {
            _loc3_ = _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex;
            _loc3_.x = 0;
            _loc3_.y = 0;
            _loc3_.u = 0;
            _loc3_.v = 0;
            _loc3_ = _loc8_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc3_.x = 0;
            _loc3_.y = 0;
            _loc3_.u = 0;
            _loc3_.v = 0;
         }
         else
         {
            _loc1_ = this.var_2142[_loc15_];
            _loc1_.material = _loc17_;
            _loc4_ = this.var_2143[0];
            _loc6_ = this.uvs[0];
            _loc5_ = this.var_2143[_loc16_];
            _loc7_ = this.uvs[_loc16_];
            _loc2_ = _loc1_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc10_ = 2 * _loc14_ * Math.PI;
            _loc11_ = Math.cos(_loc10_);
            _loc12_ = Math.sin(_loc10_);
            _loc2_.x = _loc4_.x * _loc11_ - _loc4_.y * _loc12_;
            _loc2_.y = _loc4_.x * _loc12_ + _loc4_.y * _loc11_;
            _loc12_ = -_loc12_;
            _loc2_.u = 0.5 + (_loc6_.x - 0.5) * _loc11_ - (_loc6_.y - 0.5) * _loc12_;
            _loc2_.v = 0.5 + (_loc6_.x - 0.5) * _loc12_ + (_loc6_.y - 0.5) * _loc11_;
            _loc3_ = _loc8_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc3_.x = _loc5_.x;
            _loc3_.y = _loc5_.y;
            _loc3_.u = _loc7_.x;
            _loc3_.v = _loc7_.y;
            _loc3_ = _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex;
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_.u = _loc2_.u;
            _loc3_.v = _loc2_.v;
         }
      }
   }
}
