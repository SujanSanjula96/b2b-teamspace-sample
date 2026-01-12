# Prerequisites for the B2B Teamspace Sample App Hands-On Session

Before you start, make sure you have the following:

- An Asgardeo account (https://asgardeo.io/)
- Node.js v18+ and npm (https://nodejs.org/en/download)
- A text editor or IDE of your choice
- Ballerina 2201.13.1 (https://ballerina.io/downloads/)

Use following commands to check the versions of Node.js, npm, and Ballerina installed on your machine:

```bash
node -v
npm -v
bal -v
```

Follow the steps below to verify that your environment is ready.

## Clone the B2B Teamspace Sample

Open your terminal and run the following command to clone the repository:

```bash
git clone https://github.com/SujanSanjula96/b2b-teamspace-sample.git
```

## Set up and Test the Teamspace Web App

1. Navigate to the `<PROJECT_HOME>/web-app` folder and create a `.env` or `.env.local` file with the following configurations.

```env
NEXTAUTH_URL=http://localhost:3002
BASE_URL=https://api.asgardeo.io
BASE_ORG_URL=https://api.asgardeo.io/t/{ORG_NAME}
MEETING_SERVICE_URL=http://localhost:9091
PERSONALIZATION_SERVICE_URL=http://localhost:9093
HOSTED_URL=http://localhost:3002
CHAT_SERVICE_URL=http://localhost:8000
SHARED_APP_NAME="Teamspace"
CLIENT_ID={CLIENT_ID}
CLIENT_SECRET={CLIENT_SECRET}
ADMIN_ROLE_NAME=teamspace-admin
NEXT_PUBLIC_BASIC_BRANDING_CONFIG_EDITOR_ROLE_NAME=basic-branding-editor
NEXT_PUBLIC_ADVANCED_BRANDING_CONFIG_EDITOR_ROLE_NAME=advanced-branding-editor
NEXT_PUBLIC_IDP_MANAGER_ROLE_NAME=idp-manager
NODE_TLS_REJECT_UNAUTHORIZED=0
```

Replace `{ORG_NAME}` with your Asgardeo organization handle.

2. Start the application.

From `<PROJECT_HOME>/b2b/web-app`:

```bash
npm install
npm run dev
```

3. Open the application in your browser at:

```
http://localhost:3002
```

4. Click the Sign-In button.

<img width="1223" height="893" alt="Screenshot 2026-01-12 at 19 16 48" src="https://github.com/user-attachments/assets/98ae73e3-2d23-4fc6-842a-e85795f0bf34" />

You will see an error page as follows from Asgardeo. This is expected at this stage and will be resolved once the application is fully configured.

<img width="538" height="636" alt="Screenshot 2026-01-12 at 19 16 21" src="https://github.com/user-attachments/assets/4f1c376a-838a-4cdc-83a1-86db5f3fe9e0" />

## Test the Ballerina APIs

### Meeting Service

1. Navigate to `<PROJECT_HOME>/b2b/apis/meeting-service`.

2. Run the service.

```bash
bal run
```

3. Execute the following command:

```bash
curl --location 'http://localhost:9091/meetings/test'
```

You should see the following response:

```
Meeting service is up and running!
```

### Personalization Service

1. Navigate to `<PROJECT_HOME>/b2b/apis/personalization-service`.

2. Run the service.

```bash
bal run
```

3. Execute the following command:

```bash
curl --location 'http://localhost:9093/personalization/test'
```

You should see the following response:

```
Personalization service is up and running!
```

Once all of the above services are running successfully, your environment is set up and you are good to go for the hands-on session.
