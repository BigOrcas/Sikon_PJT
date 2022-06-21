<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
    <title>ī��Ʈ�ٿ� Ÿ�̸�</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="������ ī��Ʈ�ٿ� Ÿ�̸ӷ� ���� �ɷ��� ���� ������!"/>
    <!--
        [�ܺ� ���̺귯��]
          1. Bootstrap 4 (CSS��, ������)
          2. Picker.js (��¥���ð� ���� ���̾�α�)
          3. EasyTimer.js (Ÿ�̸�)
     -->
    <link href="https://cdn.jsdelivr.net/combine/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css,npm/pickerjs@1.2.1/dist/picker.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/combine/npm/pickerjs@1.2.1/dist/picker.min.js,npm/easytimer.js@4.3.0/dist/easytimer.min.js"></script>
    <style>
      .time-picker, .values {
        background-color: #937062;
        color: #ffffff;
        text-align: center;
        font-size: 5rem;
        font-weight: bold;
        border: none;
        margin-bottom: 2rem;
        font-family: monospace; /* ������ */
      }
      #ongoing-status, #completed-status, .values, #btn-group-2, #resume-btn {
        display: none;
      }
      #ongoing-status, #completed-status, #btn-group-1, #btn-group-2 {
        text-align: center;
      }
      .btn-light {
        width: 120px;
        margin-right: 10px;
        color: #937062  !important;
      }
      .picker-opened > .picker-dialog {
        top: 13rem;
      }
    </style>
  </head>
  <body style="background-color: #f7f7f7; padding-top: 6.5rem">
    <main role="main">
      <!-- ������ ī��Ʈ�ٿ� �ð� ǥ�� -->
      <input type="text" class="form-control time-picker vw-100" value="00:01:00">
      <!-- ī��Ʈ�ٿ� '���� ��' ǥ�� -->
      <div id="ongoing-status">
        <div class="spinner-border text-light" role="status"></div>
      </div>
      <!-- ī��Ʈ�ٿ� �Ϸ� ǥ�� -->
      <div id="completed-status">
        <div class="spinner-grow text-light" role="status"></div>
      </div>
      <!-- ī��Ʈ�ٿ� ǥ�� -->
      <div class="form-control values vw-100"></div>
      <!-- ��ư �׷� 1 -->
      <div id="btn-group-1">
        <button id="set-btn" class="btn btn-light rounded-pill">
          �ð� ����
        </button>
        <button id="start-btn" class="btn btn-light rounded-pill">
          ����
        </button>
      </div>
      <!-- ��ư �׷� 2 -->
      <div id="btn-group-2">
        <button id="cancel-btn" class="btn btn-light rounded-pill">
          ���
        </button>
        <button id="pause-btn" class="btn btn-light rounded-pill">
          �Ͻ� ����
        </button>
        <button id="resume-btn" class="btn btn-light rounded-pill">
          �簳
        </button>
      </div>
    </main>
    <script>
      const timePicker = document.querySelector('.time-picker');
      const values = document.querySelector('.values');
      const btnGroup1 = document.querySelector('#btn-group-1');
      const setBtn = document.querySelector('#set-btn');
      const startBtn = document.querySelector('#start-btn');
      const btnGroup2 = document.querySelector('#btn-group-2');
      const cancelBtn = document.querySelector('#cancel-btn');
      const pauseBtn = document.querySelector('#pause-btn');
      const resumeBtn = document.querySelector('#resume-btn');
      const ongoingStatus = document.querySelector('#ongoing-status');
      const completedStatus = document.querySelector('#completed-status');

      // �ð� ���� ���̾�α� ����
      new Picker(timePicker, {
        format: 'HH:mm:ss', // ��:��:��
        text: {
          title: '�ð��� �����ϼ���',
          confirm: 'Ȯ��',
          cancel: '���'
        },
      });

      // Ÿ�̸� ����
      const timer = new easytimer.Timer();

      // Ÿ�̸� �̺�Ʈ ������ ���
      timer.addEventListener('secondsUpdated', () => {
        values.textContent = timer.getTimeValues().toString();
      });
      timer.addEventListener('started', () => {
        values.textContent = timer.getTimeValues().toString();
      });
      timer.addEventListener('reset', () => {
        values.textContent = timer.getTimeValues().toString();
      });
      timer.addEventListener('targetAchieved', () => {
        values.textContent = '�Ϸ�!'; // ī��Ʈ�ٿ� �Ϸ�

        ongoingStatus.style.display = 'none';
        completedStatus.style.display = 'block';
        btnGroup2.style.display = 'none';
        btnGroup1.style.display = 'block';
      });

      // ��ư �̺�Ʈ ������ ���
      /**
       * ['�ð� ����' ��ư]
       *   ���1. �ʱ� ȭ�鿡��
       *   ���2. ��� ��
       *   ���3. �Ϸ� ��
       */
      setBtn.addEventListener('click', () => {
        if (completedStatus.style.display === 'block') {
          values.style.display = 'none';
          timePicker.style.display = 'block';
          completedStatus.style.display = 'none';
        }

        timePicker.click();
      });
      /**
       * [���� ��ư]
       *   ���1. �ʱ� ȭ�鿡��
       *   ���2. ��� ��
       *   ���3. �Ϸ� ��
       */
      startBtn.addEventListener('click', () => {
        timer.start({countdown: true, startValues: {seconds: toSeconds(timePicker.value)}});

        if (completedStatus.style.display === 'block') {
          completedStatus.style.display = 'none';
        } else {
          timePicker.style.display = 'none';
          values.style.display = 'block';
        }
        ongoingStatus.style.display = 'block';
        btnGroup1.style.display = 'none';
        btnGroup2.style.display = 'block';
      });
      // ��� ��ư
      cancelBtn.addEventListener('click', () => {
        // '�Ͻ� ���� > ��� > ����'�� ���
        if (timer.isPaused()) {
          resumeBtn.style.display = 'none';
          pauseBtn.style.display = 'inline-block';
        }

        timer.reset();
        timer.stop();

        values.style.display = 'none';
        timePicker.style.display = 'block';
        ongoingStatus.style.display = 'none';
        btnGroup2.style.display = 'none';
        btnGroup1.style.display = 'block';
      });
      // '�Ͻ� ����' ��ư
      pauseBtn.addEventListener('click', () => {
        timer.pause();

        ongoingStatus.style.display = 'none';
        pauseBtn.style.display = 'none';
        resumeBtn.style.display = 'inline-block';
      });
      // �簳 ��ư
      resumeBtn.addEventListener('click', () => {
        timer.start();

        ongoingStatus.style.display = 'block';
        resumeBtn.style.display = 'none';
        pauseBtn.style.display = 'inline-block';
      });

      // '��:��:��'�� �ʷ� ����ϰ�, �� ������� ��ȯ�Ѵ�.
      function toSeconds(hhmmss) {
        const arr = hhmmss.split(':');
        return (+arr[0]) * 60 * 60 + (+arr[1]) * 60 + (+arr[2]);
      }
    </script>
  </body>
</html>