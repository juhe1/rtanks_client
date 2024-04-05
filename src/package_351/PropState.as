package package_351
{
   import package_352.name_1682;
   
   public class PropState
   {
      
      public static const name_2682:String = "default";
       
      
      private var var_3296:Vector.<name_3272>;
      
      public function PropState()
      {
         this.var_3296 = new Vector.<name_3272>();
         super();
      }
      
      public function name_2681(param1:name_1682, param2:Number) : void
      {
         this.var_3296.push(new name_3272(param1,param2));
      }
      
      public function get method_2972() : int
      {
         return this.var_3296.length;
      }
      
      public function method_2973(param1:int) : name_3272
      {
         return this.var_3296[param1];
      }
      
      public function name_1685() : name_1682
      {
         if(this.var_3296.length == 0)
         {
            throw new Error("No LODs found");
         }
         return name_3272(this.var_3296[0]).prop;
      }
      
      public function name_2685() : void
      {
         var _loc1_:name_3272 = null;
         for each(_loc1_ in this.var_3296)
         {
            _loc1_.name_3273();
         }
      }
   }
}
