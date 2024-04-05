package package_310
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class name_1285
   {
       
      
      private var var_2132:ImageResource;
      
      private var var_2131:Tanks3DSResource;
      
      private var var_2130:ImageResource;
      
      private var var_2133:Tanks3DSResource;
      
      private var var_2129:name_1596;
      
      public function name_1285(param1:ImageResource = null, param2:Tanks3DSResource = null, param3:ImageResource = null, param4:Tanks3DSResource = null, param5:name_1596 = null)
      {
         super();
         this.var_2132 = param1;
         this.var_2131 = param2;
         this.var_2130 = param3;
         this.var_2133 = param4;
         this.var_2129 = param5;
      }
      
      public function get blueFlagSprite() : ImageResource
      {
         return this.var_2132;
      }
      
      public function set blueFlagSprite(param1:ImageResource) : void
      {
         this.var_2132 = param1;
      }
      
      public function get bluePedestalModel() : Tanks3DSResource
      {
         return this.var_2131;
      }
      
      public function set bluePedestalModel(param1:Tanks3DSResource) : void
      {
         this.var_2131 = param1;
      }
      
      public function get redFlagSprite() : ImageResource
      {
         return this.var_2130;
      }
      
      public function set redFlagSprite(param1:ImageResource) : void
      {
         this.var_2130 = param1;
      }
      
      public function get redPedestalModel() : Tanks3DSResource
      {
         return this.var_2133;
      }
      
      public function set redPedestalModel(param1:Tanks3DSResource) : void
      {
         this.var_2133 = param1;
      }
      
      public function get sounds() : name_1596
      {
         return this.var_2129;
      }
      
      public function set sounds(param1:name_1596) : void
      {
         this.var_2129 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "CaptureTheFlagCC [";
         _loc1_ += "blueFlagSprite = " + this.blueFlagSprite + " ";
         _loc1_ += "bluePedestalModel = " + this.bluePedestalModel + " ";
         _loc1_ += "redFlagSprite = " + this.redFlagSprite + " ";
         _loc1_ += "redPedestalModel = " + this.redPedestalModel + " ";
         _loc1_ += "sounds = " + this.sounds + " ";
         return _loc1_ + "]";
      }
   }
}
