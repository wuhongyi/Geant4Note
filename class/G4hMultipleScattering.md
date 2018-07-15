<!-- G4hMultipleScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:42:56 2018 (+0800)
;; Last-Updated: 日 7月 15 08:44:25 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4hMultipleScattering

**public G4VMultipleScattering**

The class simulates the multiple scattering for any kind of charged particle.

- Model 0
	- G4UrbanMscModel

## class

```cpp
public:    // with description

  explicit G4hMultipleScattering(const G4String& processName="msc");

  virtual ~G4hMultipleScattering();

  // returns true for charged particles, false otherwise
  virtual G4bool IsApplicable (const G4ParticleDefinition& p) final;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  // This function initialise models
  virtual void InitialiseProcess(const G4ParticleDefinition*) override;
```

<!-- G4hMultipleScattering.md ends here -->
