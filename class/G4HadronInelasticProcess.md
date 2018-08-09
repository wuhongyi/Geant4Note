<!-- G4HadronInelasticProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:08:42 2018 (+0800)
;; Last-Updated: 五 8月 10 07:10:04 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4HadronInelasticProcess

**public G4HadronicProcess**

- The specific particle inelastic processes derive from this class
- This is an abstract base class, since the pure virtual function PostStepDoIt has not been defined yet.

## class

```cpp
public:
    
  G4HadronInelasticProcess(const G4String &processName,
			   G4ParticleDefinition *aParticle );
    
  virtual ~G4HadronInelasticProcess();
        
  virtual G4bool IsApplicable(const G4ParticleDefinition& aParticleType);

private:

  G4ParticleDefinition* theParticle;
```

<!-- G4HadronInelasticProcess.md ends here -->
