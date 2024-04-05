package forms.battlelist
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_2270
   {
       
      
      private var var_21:Object;
      
      private var var_2903:String;
      
      private var var_1536:int;
      
      private var var_1538:int;
      
      private var var_2908:int;
      
      private var var_947:ImageResource;
      
      private var var_2904:Boolean;
      
      private var var_2906:Boolean;
      
      private var var_2907:Boolean;
      
      private var var_2902:String;
      
      private var var_2905:MapTheme;
      
      public function name_2270()
      {
         super();
      }
      
      public function get id() : Object
      {
         return this.var_21;
      }
      
      public function set id(param1:Object) : void
      {
         this.var_21 = param1;
      }
      
      public function get gameName() : String
      {
         return this.var_2903;
      }
      
      public function set gameName(param1:String) : void
      {
         this.var_2903 = param1;
      }
      
      public function get minRank() : int
      {
         return this.var_1536;
      }
      
      public function set minRank(param1:int) : void
      {
         this.var_1536 = param1;
      }
      
      public function get maxRank() : int
      {
         return this.var_1538;
      }
      
      public function set maxRank(param1:int) : void
      {
         this.var_1538 = param1;
      }
      
      public function get maxPeople() : int
      {
         return this.var_2908;
      }
      
      public function set maxPeople(param1:int) : void
      {
         this.var_2908 = param1;
      }
      
      public function get preview() : ImageResource
      {
         return this.var_947;
      }
      
      public function set preview(param1:ImageResource) : void
      {
         this.var_947 = param1;
      }
      
      public function get ctf() : Boolean
      {
         return this.var_2904;
      }
      
      public function set ctf(param1:Boolean) : void
      {
         this.var_2904 = param1;
      }
      
      public function get tdm() : Boolean
      {
         return this.var_2906;
      }
      
      public function set tdm(param1:Boolean) : void
      {
         this.var_2906 = param1;
      }
      
      public function get dom() : Boolean
      {
         return this.var_2907;
      }
      
      public function set dom(param1:Boolean) : void
      {
         this.var_2907 = param1;
      }
      
      public function set themeName(param1:String) : void
      {
         this.var_2902 = param1;
      }
      
      public function get themeName() : String
      {
         return this.var_2902;
      }
      
      public function set theme(param1:MapTheme) : void
      {
         this.var_2905 = param1;
      }
      
      public function get theme() : MapTheme
      {
         return this.var_2905;
      }
      
      public function draw() : void
      {
      }
   }
}
