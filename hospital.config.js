module.exports = {
  apps: [
    {
      name: "hospital-8017",
      script: "manage.py",
      args: "runserver 0.0.0.0:8017",
      interpreter: "/usr/bin/python3",
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: "1G",
    },
  ],
};
