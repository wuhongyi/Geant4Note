<!--  G4HadronFissionProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:32:25 2018 (+0800)
;; Last-Updated: 五 8月 10 07:33:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

#  G4HadronFissionProcess

**public G4HadronicProcess**

Process for induced fission; 
 to be used in your physics list in case you need this physics.

## class

```cpp
public:

  G4HadronFissionProcess(const G4String& processName ="nFission");

  virtual ~G4HadronFissionProcess();
 
  virtual G4bool IsApplicable(const G4ParticleDefinition& p);

  virtual void ProcessDescription(std::ostream& outFile) const;
```

<!--  G4HadronFissionProcess.md ends here -->
