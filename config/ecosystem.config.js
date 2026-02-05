module.exports = {
  apps: [{
    name: "appSinCluster",
    script: "app.js",
    instances: 0,
    exec_mode: "cluster",
  },
  ],
};
