package package_444
{
   public final class name_2803
   {
       
      
      public var target:Object;
      
      public var property:String;
      
      public var start:Number;
      
      public var change:Number;
      
      public var name:String;
      
      public var priority:int;
      
      public var name_2804:Boolean;
      
      public var var_2744:name_2803;
      
      public var var_2743:name_2803;
      
      public function name_2803(param1:Object, param2:String, param3:Number, param4:Number, param5:String, param6:Boolean, param7:name_2803 = null, param8:int = 0)
      {
         super();
         this.target = param1;
         this.property = param2;
         this.start = param3;
         this.change = param4;
         this.name = param5;
         this.name_2804 = param6;
         if(Boolean(param7))
         {
            param7.var_2743 = this;
            this.var_2744 = param7;
         }
         this.priority = param8;
      }
   }
}
