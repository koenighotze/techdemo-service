module.exports = function(config) {
  config.set({
    mutator: 'typescript',
    packageManager: 'npm',
    reporter: ["clear-text", "progress"],
    testRunner: 'jest',
    testFramework: 'jest',
    coverageAnalysis: 'off',
    tsconfigFile: 'tsconfig.json',
    mutate: ['src/**/*.ts', '!src/**/*.test.js']
  });
};
