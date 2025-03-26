/**
 * @description Class for capture error Log
 */
public without sharing class ErrorLogRecord {
    public class DebugLog {
        public String iduser {get;set;}
        public String message {get;set;} 
        public String trace {get;set;} 
        public String typename {get;set;} 
        public String linenumber {get;set;} 
        public String errorcause {get;set;} 
        public String classname {get;set;}
        public String header {get;set;} 
        public String body {get;set;} 
        public String iprequest {get;set;}
        public String responseStatus {get;set;}
        public Integer statusCode {get;set;}
        public String responseHeader {get;set;}
        public String responseBody {get;set;}
        public string urlEndpoint {get;set;}
        public string typeApi {get;set;}
        public string menu {get;set;}
        public string recid {get;set;}
        public string objnm {get;set;}
        public string sorc {get;set;}
        public string dest {get;set;}
    }
}