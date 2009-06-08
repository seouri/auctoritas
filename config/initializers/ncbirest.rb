module Bio
  class NCBI
    class REST
      def esearch(str, hash = {}, limit = 100, step = 10000)
        serv = "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"
        opts = {
          "tool"   => "bioruby",
          "term"   => str,
        }
        opts.update(hash)
    
        case opts["rettype"]
        when "count"
          count = esearch_count(str, opts)
          return count
        else
          limit = esearch_count(str, opts) if limit == 0   # unlimit
    
          list = []
          0.step(limit, step) do |i|
            retmax = hash["retmax"] || [step, limit - i].min
            opts.update("retmax" => retmax, "retstart" => i)
            ncbi_access_wait
            response = Bio::Command.post_form(serv, opts)
            result = response.body
            list += result.scan(/<Id>(.*?)<\/Id>/m).flatten
          end
          return list
        end
      end
    end
  end
end
