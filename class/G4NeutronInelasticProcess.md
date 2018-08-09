<!-- G4NeutronInelasticProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:10:26 2018 (+0800)
;; Last-Updated: 五 8月 10 07:11:23 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4NeutronInelasticProcess

**public G4HadronInelasticProcess**

Process for Neutron Inelastic scattering; 
to be used in your physics list in case you need this physics.

## class

```cpp
  public:
    
    G4NeutronInelasticProcess(const G4String& processName = "neutronInelastic");
    
    ~G4NeutronInelasticProcess() {}

    virtual void ProcessDescription(std::ostream& outFile) const;
```

<!-- G4NeutronInelasticProcess.md ends here -->
