package package_110
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_382
   {
       
      
      private var var_883:ImageResource;
      
      private var var_880:ImageResource;
      
      private var var_879:ImageResource;
      
      private var var_881:ImageResource;
      
      private var var_884:ImageResource;
      
      private var var_882:ImageResource;
      
      private var var_877:ImageResource;
      
      private var var_878:ImageResource;
      
      private var var_876:ImageResource;
      
      public function name_382(param1:ImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:ImageResource = null, param5:ImageResource = null, param6:ImageResource = null, param7:ImageResource = null, param8:ImageResource = null, param9:ImageResource = null)
      {
         super();
         this.var_883 = param1;
         this.var_880 = param2;
         this.var_879 = param3;
         this.var_881 = param4;
         this.var_884 = param5;
         this.var_882 = param6;
         this.var_877 = param7;
         this.var_878 = param8;
         this.var_876 = param9;
      }
      
      public function get backgroundImage() : ImageResource
      {
         return this.var_883;
      }
      
      public function set backgroundImage(param1:ImageResource) : void
      {
         this.var_883 = param1;
      }
      
      public function get fiveBoxImage() : ImageResource
      {
         return this.var_880;
      }
      
      public function set fiveBoxImage(param1:ImageResource) : void
      {
         this.var_880 = param1;
      }
      
      public function get fiveBoxOpenedImage() : ImageResource
      {
         return this.var_879;
      }
      
      public function set fiveBoxOpenedImage(param1:ImageResource) : void
      {
         this.var_879 = param1;
      }
      
      public function get lootBackgroundImage() : ImageResource
      {
         return this.var_881;
      }
      
      public function set lootBackgroundImage(param1:ImageResource) : void
      {
         this.var_881 = param1;
      }
      
      public function get oneBoxImage() : ImageResource
      {
         return this.var_884;
      }
      
      public function set oneBoxImage(param1:ImageResource) : void
      {
         this.var_884 = param1;
      }
      
      public function get oneBoxOpenedImage() : ImageResource
      {
         return this.var_882;
      }
      
      public function set oneBoxOpenedImage(param1:ImageResource) : void
      {
         this.var_882 = param1;
      }
      
      public function get raysImage() : ImageResource
      {
         return this.var_877;
      }
      
      public function set raysImage(param1:ImageResource) : void
      {
         this.var_877 = param1;
      }
      
      public function get threeBoxImage() : ImageResource
      {
         return this.var_878;
      }
      
      public function set threeBoxImage(param1:ImageResource) : void
      {
         this.var_878 = param1;
      }
      
      public function get threeBoxOpenedImage() : ImageResource
      {
         return this.var_876;
      }
      
      public function set threeBoxOpenedImage(param1:ImageResource) : void
      {
         this.var_876 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LootBoxModelCC [";
         _loc1_ += "backgroundImage = " + this.backgroundImage + " ";
         _loc1_ += "fiveBoxImage = " + this.fiveBoxImage + " ";
         _loc1_ += "fiveBoxOpenedImage = " + this.fiveBoxOpenedImage + " ";
         _loc1_ += "lootBackgroundImage = " + this.lootBackgroundImage + " ";
         _loc1_ += "oneBoxImage = " + this.oneBoxImage + " ";
         _loc1_ += "oneBoxOpenedImage = " + this.oneBoxOpenedImage + " ";
         _loc1_ += "raysImage = " + this.raysImage + " ";
         _loc1_ += "threeBoxImage = " + this.threeBoxImage + " ";
         _loc1_ += "threeBoxOpenedImage = " + this.threeBoxOpenedImage + " ";
         return _loc1_ + "]";
      }
   }
}
