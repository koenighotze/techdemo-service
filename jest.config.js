module.exports = {
  globals: {
    'ts-jest': {
      tsConfig: 'tsconfig.json',
    },
  },
  moduleFileExtensions: [
    'js',
    'ts',
  ],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  testMatch: [
    '**/src/**/*.test.(ts|js)',
  ],
  roots: [ 'src' ],
  testEnvironment: 'node',
  preset: 'ts-jest',
  reporters: [
    "default",
    [ "jest-junit", { 'outputDirectory': 'reports/tests' } ]
  ],
  resetModules: true,
  resetMocks: true,
  coverageDirectory: "reports/coverage",
}