class dram_cov #(type T=dram_seq_item) extends uvm_subscriber #(T);
  

  
  `uvm_component_utils(dram_cov)
    T req;

   real cov;

    covergroup cg;
        wr   : coverpoint req.wr;  
  
     en : coverpoint req.en;
      addr : coverpoint req.add{
        bins low    = {[0:32]};
       
        bins high   = {[33:63]};
  }
      data : coverpoint  req.data_in {
        bins low    = {[0:150]};
    
    bins high   = {[151:255]};
  }

    endgroup: cg
        
  function new(string name="sr_coverage", uvm_component parent);
        super.new(name, parent);
  
     req = dram_seq_item::type_id::create("req");
        cg = new();
    endfunction: new

  function void write(dram_seq_item t);
        req = t;
//         i++;
        cg.sample();
      $display("coverage=%f", cg.get_inst_coverage);
    endfunction: write
  
    function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    cov=cg.get_coverage();
  endfunction
  
   function void report_phase(uvm_phase phase);
    super.report_phase(phase);
     `uvm_info(get_type_name(),$sformatf("Coverage is %f",cov),UVM_MEDIUM);
  endfunction


endclass