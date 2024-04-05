package alternativa.proplib
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.utils.XMLUtils;
   import flash.utils.ByteArray;
   import package_303.TextureByteData;
   import package_351.PropData;
   import package_351.PropGroup;
   import package_351.PropState;
   import package_352.PropMesh;
   import package_352.name_1682;
   import package_352.name_2677;
   import package_353.ByteArrayMap;
   import package_353.TextureByteDataMap;
   
   public class PropLibrary
   {
      
      public static const const_1996:String = "library.xml";
      
      public static const const_1997:String = "images.xml";
       
      
      private var var_2423:PropGroup;
      
      private var var_2422:ByteArrayMap;
      
      private var var_2424:TextureByteDataMap;
      
      public function PropLibrary(param1:ByteArrayMap)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Parameter files is null");
         }
         this.var_2422 = param1;
         var _loc2_:ByteArray = param1.getValue("images.xml");
         if(_loc2_ != null)
         {
            this.var_2424 = this.method_2457(XML(_loc2_.toString()));
         }
         _loc2_ = null;
         this.var_2423 = this.method_2455(XML(param1.getValue("library.xml").toString()));
         method_1204(this.var_2423);
      }
      
      private static function method_1204(param1:PropGroup) : void
      {
         var _loc2_:PropGroup = null;
         var _loc3_:PropData = null;
         var _loc4_:name_1682 = null;
         if(param1.name_1681 != null)
         {
            for each(_loc2_ in param1.name_1681)
            {
               method_1204(_loc2_);
            }
         }
         if(param1.props != null)
         {
            for each(_loc3_ in param1.props)
            {
               _loc4_ = _loc3_.name_1684().name_1685();
               if(_loc4_.object is Mesh)
               {
                  Mesh(_loc4_.object).calculateFacesNormals();
                  Mesh(_loc4_.object).calculateVerticesNormalsByAngle(65 / 180 * Math.PI,0.01);
               }
            }
         }
      }
      
      public function get name() : String
      {
         return this.var_2423 == null ? null : this.var_2423.name;
      }
      
      public function get name_1683() : PropGroup
      {
         return this.var_2423;
      }
      
      private function method_2457(param1:XML) : TextureByteDataMap
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:TextureByteDataMap = new TextureByteDataMap();
         for each(_loc3_ in param1.image)
         {
            _loc4_ = _loc3_.@name;
            _loc5_ = _loc3_.attribute("new-name").toString().toLowerCase();
            _loc6_ = XMLUtils.name_2680(_loc3_,"alpha",null);
            if(_loc6_ != null)
            {
               _loc6_ = _loc6_.toLowerCase();
            }
            _loc2_.putValue(_loc4_,new TextureByteData(this.var_2422.getValue(_loc5_),this.var_2422.getValue(_loc6_)));
         }
         return _loc2_;
      }
      
      private function method_2455(param1:XML) : PropGroup
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc2_:PropGroup = new PropGroup(XMLUtils.name_2676(param1.@name));
         for each(_loc3_ in param1.prop)
         {
            _loc2_.name_2684(this.method_2458(_loc3_));
         }
         for each(_loc4_ in param1.elements("prop-group"))
         {
            _loc2_.name_2683(this.method_2455(_loc4_));
         }
         return _loc2_;
      }
      
      private function method_2458(param1:XML) : PropData
      {
         var _loc4_:XML = null;
         var _loc2_:PropData = new PropData(XMLUtils.name_2676(param1.@name));
         var _loc3_:XMLList = param1.state;
         if(_loc3_.length() > 0)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc2_.name_2679(XMLUtils.name_2676(_loc4_.@name),this.method_2454(_loc4_));
            }
         }
         else
         {
            _loc2_.name_2679(PropState.name_2682,this.method_2454(param1));
         }
         return _loc2_;
      }
      
      private function method_2454(param1:XML) : PropState
      {
         var _loc4_:XML = null;
         var _loc2_:PropState = new PropState();
         var _loc3_:XMLList = param1.lod;
         if(_loc3_.length() > 0)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc2_.name_2681(this.method_2456(_loc4_),Number(_loc4_.@distance));
            }
         }
         else
         {
            _loc2_.name_2681(this.method_2456(param1),0);
         }
         return _loc2_;
      }
      
      private function method_2456(param1:XML) : name_1682
      {
         if(param1.mesh.length() > 0)
         {
            return this.method_2459(param1.mesh[0]);
         }
         if(param1.sprite.length() > 0)
         {
            return this.method_2460(param1.sprite[0]);
         }
         throw new Error("Unknown prop type");
      }
      
      private function method_2459(param1:XML) : PropMesh
      {
         var _loc5_:XML = null;
         var _loc2_:ByteArray = this.var_2422.getValue(param1.@file.toString().toLowerCase());
         var _loc3_:Object = null;
         if(param1.texture.length() > 0)
         {
            _loc3_ = {};
            for each(_loc5_ in param1.texture)
            {
               _loc3_[XMLUtils.name_2676(_loc5_.@name)] = _loc5_.attribute("diffuse-map").toString().toLowerCase();
            }
         }
         var _loc4_:String = XMLUtils.name_2680(param1,"object",null);
         return new PropMesh(_loc2_,_loc4_,_loc3_,this.var_2422,this.var_2424);
      }
      
      private function method_2460(param1:XML) : name_2677
      {
         var _loc2_:String = param1.@file.toString().toLowerCase();
         var _loc3_:TextureByteData = this.var_2424 == null ? new TextureByteData(this.var_2422.getValue(_loc2_)) : this.var_2424.getValue(_loc2_);
         var _loc4_:Number = XMLUtils.name_2678(param1,"origin-x",0.5);
         var _loc5_:Number = XMLUtils.name_2678(param1,"origin-y",0.5);
         var _loc6_:Number = XMLUtils.name_2678(param1,"scale",1);
         return new name_2677(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function freeMemory() : *
      {
      }
   }
}
