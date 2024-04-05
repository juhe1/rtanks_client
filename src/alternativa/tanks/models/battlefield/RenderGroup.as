package alternativa.tanks.models.battlefield
{
   public class RenderGroup
   {
       
      
      private var var_2072:Vector.<name_1229>;
      
      private var size:int;
      
      private var var_2073:Boolean;
      
      private const var_679:Vector.<name_1384> = new Vector.<name_1384>();
      
      public function RenderGroup()
      {
         this.var_2072 = new Vector.<name_1229>();
         super();
      }
      
      public function name_755(param1:name_1229) : void
      {
         if(this.var_2073)
         {
            this.var_679.push(new name_2465(this,param1));
         }
         else if(this.var_2072.indexOf(param1) < 0)
         {
            var _loc2_:* = this.size++;
            this.var_2072[_loc2_] = param1;
         }
      }
      
      public function method_776(param1:name_1229) : void
      {
         var _loc2_:int = 0;
         if(this.var_2073)
         {
            this.var_679.push(new name_2464(this,param1));
         }
         else
         {
            _loc2_ = this.var_2072.indexOf(param1);
            if(_loc2_ >= 0)
            {
               this.var_2072[_loc2_] = this.var_2072[--this.size];
               this.var_2072[this.size] = null;
            }
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:name_1229 = null;
         this.var_2073 = true;
         var _loc4_:int = 0;
         while(_loc4_ < this.size)
         {
            _loc3_ = this.var_2072[_loc4_];
            _loc3_.render(param1,param2);
            _loc4_++;
         }
         this.var_2073 = false;
         this.method_2182();
      }
      
      private function method_2182() : void
      {
         var _loc1_:name_1384 = null;
         while((_loc1_ = this.var_679.pop()) != null)
         {
            _loc1_.execute();
         }
      }
   }
}
