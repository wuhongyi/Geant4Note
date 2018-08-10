<!-- G4HadronCaptureProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:52:43 2018 (+0800)
;; Last-Updated: 五 8月 10 07:53:25 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4HadronCaptureProcess

**public G4HadronicProcess**

Process for capture of neutral hadrons; 
to be used in your physics list in case you need this physics.

## class

```cpp
  public:

    G4HadronCaptureProcess(const G4String& processName ="nCapture");
  
    virtual ~G4HadronCaptureProcess();
 
    virtual G4bool IsApplicable(const G4ParticleDefinition& aParticleType);

    virtual void ProcessDescription(std::ostream& outFile) const;
```

<!-- G4HadronCaptureProcess.md ends here -->
