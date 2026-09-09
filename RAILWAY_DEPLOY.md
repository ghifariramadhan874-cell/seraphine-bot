# 🤖 Seraphine AI Bot - Railway Deployment Guide

## Setup Railway (24/7 Hosting)

### Step 1: Persiapan
1. Buat akun di [railway.app](https://railway.app) (connect GitHub)
2. Persiapkan GitHub repository dengan bot files

### Step 2: Push ke GitHub

```bash
# Navigate ke folder bot
cd C:\Users\Elica\seraphine-bot-openrouter

# Initialize git (kalo belum)
git init
git add .
git commit -m "Initial commit - Seraphine AI Bot"

# Tambah remote (ganti USERNAME dengan GitHub username lu)
git remote add origin https://github.com/USERNAME/seraphine-bot.git
git branch -M main
git push -u origin main
```

### Step 3: Deploy ke Railway

1. Buka [railway.app](https://railway.app)
2. Click `New Project` → `Deploy from GitHub`
3. Select repository `seraphine-bot`
4. Railway auto-detect `Procfile` dan `requirements.txt`
5. Click `Deploy`

### Step 4: Setup Environment Variables

Di Railway Dashboard:
1. Click project → `Variables`
2. Tambah environment variables:
   ```
   DISCORD_TOKEN=YOUR_TOKEN_HERE
   OPENROUTER_API_KEY=YOUR_KEY_HERE
   NEWSAPI_KEY=YOUR_KEY_HERE
   LOG_LEVEL=INFO
   MOD_LOG_CHANNEL=moderator-only
   ```
3. Click `Save`

### Step 5: Start Service

1. Di Railway → `Deployments`
2. Click latest deployment
3. Status akan berubah jadi `Running` (tunggu ~2-3 menit)
4. Bot sekarang online 24/7! 🎉

---

## Local Testing

Sebelum deploy, test dulu di local:

```bash
# Install dependencies
pip install -r requirements.txt

# Setup .env file (sudah ada)

# Run bot
python bot.py
```

---

## Monitoring

Di Railway Dashboard bisa lihat:
- ✅ Real-time logs
- ✅ Deployment history
- ✅ Resource usage
- ✅ Error messages

---

## Important Notes

- Railway free tier dapat: 500 hours/bulan (~20 hari nonstop)
- Cukup buat bot yang jalan 24/7
- Database (`bot.log`, `.db`) stored di Railway ephemeral storage (reset setiap deploy)
- Buat persist data, upgrade ke paid plan

---

## Troubleshooting

**Bot offline?**
- Check Railway logs untuk error
- Verify environment variables sudah set
- Pastikan Discord token valid

**Database hilang?**
- Railway ephemeral storage ≠ persistent
- Buat production, upgrade ke paid plan atau pake database eksternal

**Deploy gagal?**
- Check `requirements.txt` syntax
- Pastikan `Procfile` format benar
- Check bot.py syntax: `python -m py_compile bot.py`

---

## Next Steps

Setelah bot jalan 24/7 di Railway:
1. Monitor logs regularly
2. Update bot code via GitHub push
3. Railway auto-redeploy
4. Add database service untuk persistent storage (optional)

---

**Bot sekarang bisa jalan forever! 🚀**
