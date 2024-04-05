package alternativa.proplib
{
   public class PropLibRegistry
   {
       
      
      private var var_159:Object;
      
      public function PropLibRegistry()
      {
         this.var_159 = {};
         super();
      }
      
      public function name_1677(param1:PropLibrary) : void
      {
         this.var_159[param1.name] = param1;
      }
      
      public function destroy(param1:Boolean = false) : *
      {
         var _loc2_:PropLibrary = null;
         for each(_loc2_ in this.var_159)
         {
            _loc2_.freeMemory();
            _loc2_ = null;
         }
      }
      
      public function method_1634(param1:String) : PropLibrary
      {
         return this.var_159[param1];
      }
      
      public function get libraries() : Vector.<PropLibrary>
      {
         var _loc2_:PropLibrary = null;
         var _loc1_:Vector.<PropLibrary> = new Vector.<PropLibrary>();
         for each(_loc2_ in this.var_159)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
   }
}
