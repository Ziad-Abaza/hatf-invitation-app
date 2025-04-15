@extends('dashboard.layout.main')

@section('main')
    <style>
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .dashboard-group {
            flex: 1 1 100%;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-group-title {
            font-size: 1.4rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
            padding-left: 10px;
            border-left: 4px solid #4b7bec;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }

        .dashboard-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .card-icon {
            font-size: 2rem;
            color: #4b7bec;
            margin-bottom: 10px;
        }

        .card-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
        }

        .card-value {
            font-size: 1.6rem;
            font-weight: bold;
            color: #4b7bec;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }

        .chart-container {
            flex: 1 1 300px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .chart-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
    </style>

    <div class="dashboard-container">
        <!-- مجموعة إحصائيات المستخدمين -->
        <div class="dashboard-group">
            <div class="dashboard-group-title">إحصائيات المستخدمين</div>
            <div class="dashboard-cards">
                <a href="{{ route('dashboard.users.index', ['slug' => 'online_today_users']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-user-friends card-icon"></i>
                        <div class="card-title">المستخدمون المتصلون اليوم</div>
                        <div class="card-value">{{ $data['online_today_users'] }}</div>
                    </div>
                </a>
                <a href="{{ route('dashboard.users.index', ['slug' => 'online_week_users']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-calendar-week card-icon"></i>
                        <div class="card-title">المستخدمون المتصلون هذا الأسبوع</div>
                        <div class="card-value">{{ $data['online_week_users'] }}</div>
                    </div>

                </a>




                <a href="{{ route('dashboard.users.index', ['slug' => 'online_month_users']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-calendar-alt card-icon"></i>
                        <div class="card-title">المستخدمون المتصلون هذا الشهر</div>
                        <div class="card-value">{{ $data['online_month_users'] }}</div>
                    </div>
                </a>



                <a href="{{ route('dashboard.users.index', ['slug' => 'online_year_users']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-calendar card-icon"></i>
                        <div class="card-title">المستخدمون المتصلون هذا العام</div>
                        <div class="card-value">{{ $data['online_year_users'] }}</div>
                    </div>
                </a>




                <a href="{{ route('dashboard.users.index', ['slug' => 'total_users']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-users card-icon"></i>
                        <div class="card-title">إجمالي المستخدمين</div>
                        <div class="card-value">{{ $data['total_users'] }}</div>
                    </div>
                </a>



                <a href="{{ route('dashboard.users.index', ['slug' => 'total_markters']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-bullhorn card-icon"></i>
                        <div class="card-title">إجمالي المسوقين</div>
                        <div class="card-value">{{ $data['total_users'] }}</div>
                    </div>
                </a>


                <a href="{{ route('dashboard.admin.index') }}">
                    <div class="dashboard-card">
                        <i class="fas fa-user-shield card-icon"></i>
                        <div class="card-title">إجمالي المسؤولين</div>
                        <div class="card-value">{{ $data['total_admins'] }}</div>
                    </div>
                </a>


            </div>
        </div>

        <!-- مجموعة إحصائيات الدعوات -->
        <div class="dashboard-group">
            <div class="dashboard-group-title">إحصائيات الدعوات</div>
            <div class="dashboard-cards">

                <a href="{{ route('dashboard.hall.index') }}">
                    <div class="dashboard-card">
                        <i class="fas fa-building card-icon"></i>
                        <div class="card-title">إجمالي القاعات</div>
                        <div class="card-value">{{ $data['total_halls'] }}</div>
                    </div>
                </a>
                <a href="{{ route('dashboard.invitation.index') }}">
                    <div class="dashboard-card">
                        <i class="fas fa-envelope-open-text card-icon"></i>
                        <div class="card-title">إجمالي الدعوات</div>
                        <div class="card-value">{{ $data['total_invitaions'] }}</div>
                    </div>
                </a>      
            </div>
        </div>


        <div class="dashboard-group">
            <div class="dashboard-group-title">بيانات الدعوات</div>
            <div class="dashboard-cards">
                @foreach ($data['invitations'] as $invitation )
                <div class="dashboard-card" style="display: flex; align-items: center; padding: 20px; border-radius: 10px; background-color: #f4f5f7; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); transition: transform 0.2s; width: 250px; height: 200px; margin: 10px;">
                    <div class="card-content" style="flex: 1;">
                        <h4 class="card-title" style="font-size: 20px; font-weight: bold; color: #333; margin-bottom: 10px;">
                            {{ json_decode($invitation['name'], true)['name_ar']  }}
                        </h4>
                        <div class="card-details" style="display: flex; flex-direction: column; gap: 5px;">
                            <div class="card-detail" style="display: flex; align-items: center; font-size: 14px; color: #666;">
                                <i class="fas fa-user-friends" style="margin-right: 8px; color: #4b7bec;"></i>
                                <span>عدد المستخدمين: {{ $invitation['number_of_users'] }}</span>
                            </div>
                            <div class="card-detail" style="display: flex; align-items: center; font-size: 14px; color: #666;">
                                <i class="fas fa-dollar-sign" style="margin-right: 8px; color: #4b7bec;"></i>
                                <span>السعر: {{ $invitation['prise'] }}</span>
                            </div>
                            <div class="card-detail" style="display: flex; align-items: center; font-size: 14px; color: #666;">
                                <i class="fas fa-inbox" style="margin-right: 8px; color: #4b7bec;"></i>
                                <span>العدد: {{ $invitation['count'] }}</span>
                            </div>
                        </div>
                    </div>
                </div>                
                @endforeach         
            </div>
        </div>

        <!-- مجموعة إحصائيات الدفع -->
        <div class="dashboard-group">
            <div class="dashboard-group-title">إحصائيات الدفع</div>
            <div class="dashboard-cards">
               

                <a href="{{ route('dashboard.payments.index', ['slug' => 'total_payment']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-dollar-sign card-icon"></i>
                        <div class="card-title">إجمالي الدفعات
                            ({{ $data['success_payment']['count'] + $data['fail_payment']['count'] }})</div>
                        <div class="card-value">{{ $data['success_payment']['value'] + $data['fail_payment']['value'] }}</div>
                    </div>
                </a>

                <a href="{{ route('dashboard.payments.index', ['slug' => 'success_payment']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-check-circle card-icon"></i>
                        <div class="card-title">دفعات ناجحة ({{ $data['success_payment']['count'] }})</div>
                        <div class="card-value">{{ $data['success_payment']['value'] }}</div>
                    </div>
                </a>


                <a href="{{ route('dashboard.payments.index', ['slug' => 'fail_payment']) }}">
                    <div class="dashboard-card">
                        <i class="fas fa-times-circle card-icon"></i>
                        <div class="card-title">دفعات فاشلة ({{ $data['fail_payment']['count'] }})</div>
                        <div class="card-value">{{ $data['fail_payment']['value'] }}</div>
                    </div>
                </a>


            </div>
        </div>
    </div>

    <!-- HTML لحاويات الرسوم البيانية -->
    <div class="dashboard-container">
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <div class="chart-container">
                        <div class="chart-title">نسبة النجاح مقابل الفشل في الدفعات</div>
                        <canvas id="paymentChart"></canvas>
                    </div>
                </div>

                <div class="col-8">
                    <div class="chart-container">
                        <div class="chart-title">حالة الدعوات: عامة، خاصة، ومتوسطة</div>
                        <canvas id="invitationStatusChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- تضمين مكتبة Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // بيانات للرسم البياني للدفعات
        var successCount = @json($data['success_payment']['count']);
        var failCount = @json($data['fail_payment']['count']);

        // حساب النسب
        var totalPayments = successCount + failCount;
        var successfulPercentage = totalPayments > 0 ? (successCount / totalPayments) * 100 : 0;
        var failPercentage = totalPayments > 0 ? (failCount / totalPayments) * 100 : 0;

        const paymentData = {
            labels: ['دفعات ناجحة', 'دفعات فاشلة'],
            datasets: [{
                data: [successfulPercentage, failPercentage],
                backgroundColor: ['#4caf50', '#f44336'],
            }],
        };

        const paymentConfig = {
            type: 'pie',
            data: paymentData,
        };

        new Chart(document.getElementById('paymentChart'), paymentConfig);

    // Pass the PHP data to JavaScript
    var invitationLabels = @json($labels);
    var invitationCounts = @json($invatdata);

    const invitationStatusData = {
        labels: invitationLabels,
        datasets: [{
            label: 'عدد الدعوات',
            data: invitationCounts,
            backgroundColor: ['#4b7bec', '#f44336', '#ff9800'],
        }],
    };

    const invitationStatusConfig = {
        type: 'bar',
        data: invitationStatusData,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'حالة الدعوات',
                },
            },
        },
    };

    new Chart(document.getElementById('invitationStatusChart'), invitationStatusConfig);
    </script>
@endsection
