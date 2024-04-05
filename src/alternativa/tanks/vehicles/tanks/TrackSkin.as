package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.UVMatrixProvider;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   import package_302.TrackMaterial;
   
   public class TrackSkin
   {
       
      
      private var var_2027:UVMatrixProvider;
      
      private var faces:Vector.<Face>;
      
      private var vertices:Vector.<Vertex>;
      
      private var ratio:Number;
      
      private var distance:Number = 0;
      
      public function TrackSkin()
      {
         this.faces = new Vector.<Face>();
         super();
      }
      
      private static function method_2109(param1:Face) : Number
      {
         var _loc2_:Vector.<Vertex> = param1.vertices;
         return method_2110(_loc2_[0],_loc2_[1]);
      }
      
      private static function method_2110(param1:Vertex, param2:Vertex) : Number
      {
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = param1.y - param2.y;
         var _loc5_:Number = param1.z - param2.z;
         var _loc6_:Number = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
         var _loc7_:Number = param1.u - param2.u;
         var _loc8_:Number = param1.v - param2.v;
         var _loc9_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_);
         return _loc9_ / _loc6_;
      }
      
      public function addFace(param1:Face) : void
      {
         this.faces.push(param1);
      }
      
      public function init() : void
      {
         var _loc1_:Face = null;
         var _loc2_:* = undefined;
         var _loc3_:Vertex = null;
         var _loc4_:Number = 0;
         var _loc5_:Dictionary = new Dictionary();
         for each(_loc1_ in this.faces)
         {
            for each(_loc3_ in _loc1_.vertices)
            {
               _loc5_[_loc3_] = true;
            }
            _loc4_ += method_2109(_loc1_);
         }
         this.ratio = _loc4_ / this.faces.length;
         this.vertices = new Vector.<Vertex>();
         for(_loc2_ in _loc5_)
         {
            this.vertices.push(_loc2_);
         }
      }
      
      public function move(param1:Number) : void
      {
         var _loc2_:Matrix = null;
         this.distance += param1 * this.ratio;
         if(this.var_2027 != null)
         {
            _loc2_ = this.var_2027.getMatrix();
            _loc2_.tx = this.distance;
         }
      }
      
      public function setMaterial(param1:Material) : void
      {
         var _loc2_:Face = null;
         var _loc3_:TrackMaterial = null;
         for each(_loc2_ in this.faces)
         {
            _loc2_.material = param1;
         }
         if(param1 is TrackMaterial)
         {
            _loc3_ = param1 as TrackMaterial;
            this.var_2027 = _loc3_.var_2023;
         }
      }
   }
}
