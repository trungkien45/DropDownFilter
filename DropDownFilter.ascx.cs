using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

namespace WebApplication5.Control.Common
{
    public partial class DropDownFilter : System.Web.UI.UserControl
    {
        [BindableAttribute(true)]
        [ThemeableAttribute(false)]
        public object DataSource {
            get {
                return DropDownList1.DataSource;
            }
            set { DropDownList1.DataSource = value; }
        }

        public bool NeedVal {
            get { return RequiredFieldValidator1.Enabled; }
            set { RequiredFieldValidator1.Enabled = value; }
        }
        public string DataSourceID { get { return DropDownList1.DataSourceID; }
            set { DropDownList1.DataSourceID = value; }
        }
        public string DataTextField {
            get { return DropDownList1.DataTextField; }
            set { DropDownList1.DataTextField = value; }
        }
        public string DataValueField {
            get { return DropDownList1.DataValueField; }
            set { DropDownList1.DataValueField = value; }
        }
        public ListItem SelectedItem
        {
            get
            {
                return DropDownList1.SelectedItem;
            }
        }
        public override void DataBind()
        {
            base.DataBind();
            
            DropDownList1.DataBind();
        }
        public ListItemCollection Items
        {
            get { return DropDownList1.Items; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            RequiredFieldValidator1.ValidationGroup = this.ClientID;
            //DropDownList1.DataTextField
            //DropDownList1.s
            //DropDownList1.DataSource
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, "");
        }
    }
}